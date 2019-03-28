const collection = require('./../../Database/Collections');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');
const push = require('./../../Library/Helpers/FCM');
const userMysql = require('./../../Library/CommonQueries/Users');
const followerMysql = require('./../../Library/CommonQueries/Followers');

var sendFollowRequest = async(req, res) => {
  req.checkBody('user_id','User Id is required').notEmpty();
  req.checkBody('status','status is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    var userId = await getUserId(req.body.session_id);
    var isBlocked = await userMysql.checkBlocked(userId, req.body.user_id);
    if(isBlocked){
      throw 'User blocked';
    }

    //check if already sent
    if(req.body.status == constants.FOLLOW_REQUEST_SEND){
        var isSent = await checkRequest(userId, req.body.user_id , constants.FOLLOW_REQUEST_SEND);
        if(isSent){
          throw 'Follow request already sent!';
        }

        var isAccepted = await checkRequest(userId, req.body.user_id ,constants.FOLLOW_REQUEST_ACCEPTED);
        if(isAccepted){
          throw 'Follow request already accepted!';
        }
    }

    if(req.body.status == constants.FOLLOW_REQUEST_ACCEPTED){
        var isRequestSent = await checkIfSend(req.body.user_id,userId);
        if(isRequestSent){
          var isAccepted = await checkRequest(req.body.user_id, userId ,constants.FOLLOW_REQUEST_ACCEPTED);
          if(isAccepted){
            throw 'Follow request already accepted!';
          }
        } else {
          throw 'No request found';
        }        
    }
   
    switch(parseInt(req.body.status)){
      case constants.FOLLOW_REQUEST_SEND :
        var newRequest = await collection.UserFollowRequestsModel.forge({request_user_id : userId , receive_user_id : req.body.user_id, status : constants.FOLLOW_REQUEST_SEND}).save();
        var newNotify = await newNotification(req.body.user_id, userId, constants.NOTIFICATION_NEW_FOLLOW_REQUEST , constants.NEW_NOTIFICATION);
      break;

      case constants.FOLLOW_REQUEST_CANCELLED :

      var isRequestSent = await checkIfSend(userId,req.body.user_id);
      if(!isRequestSent){
        throw 'No request found';
      }

       var update = await collection.UserFollowRequestsModel.query(qb => {
                            qb.where('request_user_id',userId);
                            qb.where('receive_user_id',req.body.user_id);
                      }).destroy();
       var updateNotify = await collection.UserNotificationModel.query(qb => {
                           qb.where('user_id',req.body.user_id);
                           qb.where('follower_id',userId);
                           qb.whereNull('post_id');
                      }).destroy();
      break;

      case constants.FOLLOW_REQUEST_ACCEPTED :
        var updateRequest = await updateRequestStatus(req.body.user_id, userId, constants.FOLLOW_REQUEST_ACCEPTED);
        var newFollower = await collection.UserFollowersModel.forge({follower_id : req.body.user_id , followed_id : userId}).save();
        var updateNotify = await collection.UserNotificationModel.query({where : {user_id : userId , follower_id : req.body.user_id}})
                           .save({type : constants.NOTIFICATION_FOLLOW_REQUEST_ACCEPTED}, {patch : true});
        //var newNotify = await newNotification(userId, req.body.user_id, constants.NOTIFICATION_FOLLOW_REQUEST_ACCEPTED , constants.NEW_NOTIFICATION);
      break; 

      case constants.FOLLOW_REQUEST_REJECTED :
        var isRequestSent = await checkIfSend(req.body.user_id,userId);
        if(!isRequestSent){
          throw 'No request found';
        }
        var updateRequest = await collection.UserFollowRequestsModel.query(qb => {
                            qb.where('request_user_id',req.body.user_id);
                            qb.where('receive_user_id',userId);
                      }).destroy();
        var updateNotify = await collection.UserNotificationModel.query(qb => {
                           qb.where('user_id',userId);
                           qb.where('follower_id',req.body.user_id);
                           qb.whereNull('post_id');
                      }).destroy();
      break;

      case constants.USER_REQUEST_UNFOLLOW :
        var isRequestSent = await checkIfSend(userId,req.body.user_id);
        if(!isRequestSent){
          throw 'No request found';
        }      
        var updateRequest = await deleteRequest(userId, req.body.user_id);
        var removeFollower = await collection.UserFollowersModel.query({where : {follower_id : userId , followed_id : req.body.user_id}}).destroy();
      break;     
    }
    
    var user = await userMysql.getUserInfo(req.body.user_id);
    var jsonOutput = await userMysql.getUserProfile(user,null,null,userId);
    return jsonOutput;
  }
};

var checkRequest = async (userId , receiverId , type) => {
  var checkRequest = await collection.UserFollowRequestsModel.query(qb => {
                           qb.where('request_user_id',userId);
                           qb.where('receive_user_id',receiverId);
                           qb.where('status',type);
                         }).fetch();
  if(checkRequest!=null){
    return true;
  }
  else{
    return false;
  }
};

var checkIfSend = async(userId, receiverId) => {
  var isSent = await collection.UserFollowRequestsModel.query(qb => {
                            qb.where('request_user_id',userId);
                            qb.where('receive_user_id',receiverId);
                    }).fetch();
  if(isSent!=null){
    return true;
  } else {
    return false;
  }
};

var newNotification = async(userId, senderId, type, notifyType) => {
  if(notifyType == constants.NEW_NOTIFICATION){
    var checkNotification = await collection.UserNotificationModel.query({where :{user_id : userId , follower_id : senderId, type : type}}).fetch();
    if(checkNotification!=null){
      var destroyPrevious = await collection.UserNotificationModel.query({where : {id : checkNotification.attributes.id}}).destroy();
    }
    var newNotify = await collection.UserNotificationModel.forge({user_id : userId , follower_id : senderId, type : type}).save();

    var sendPush = await notifyReceiver(userId,senderId,type);
  } else {
    var updateNotify = await collection.UserNotificationModel.query(qb => {
                           qb.where('user_id',userId);
                           qb.where('follower_id',senderId);
                       }).save({type : type} , {patch : true});
  }
  return;
};

var notifyReceiver = async(userId, receiverId , type) => {
  try{
  if(type == constants.NOTIFICATION_NEW_FOLLOW_REQUEST){
    var user = await userMysql.getUserInfo(receiverId);
    var userObj = await userMysql.getUserProfile(user,null,null,userId);
    var message = user.attributes.username + constants.PUSH_MESSAGE_FOLLOW_REQUEST;
  } else {
    var user = await userMysql.getUserInfo(userId);
    var userObj = await userMysql.getUserProfile(user,null,null,receiverId);
    var message = user.attributes.username + constants.PUSH_MESSAGE_ACCEPT_REQUEST;   
    userId = receiverId;
  }

  var pushData = {};
  pushData.push_type = constants.PUSH_TYPE_FOLLOW_REQUESTS;
  pushData.user = userObj;
  pushData.post = {};
  pushData.conversation = {};
  pushData.message_to_display = message;
  var notifyUser = await userMysql.notifyReceiver(userId, pushData, user.attributes.username);
} catch (e) {
  console.log(e);
}
  return;
};


var updateRequestStatus = async(requestUserId, receiveUserId, status) => {
  var updateRequest = await collection.UserFollowRequestsModel.query(qb => {
                            qb.where('request_user_id',requestUserId);
                            qb.where('receive_user_id',receiveUserId);
                            qb.where('status',constants.FOLLOW_REQUEST_SEND);
                      }).save({status : status} , {patch : true});
  return;
};

var deleteRequest = async(requestUserId, receiveUserId) => {
  try{
 var deleteRequest = await collection.UserFollowRequestsModel.query(qb => {
                            qb.where('request_user_id',requestUserId);
                            qb.where('receive_user_id',receiveUserId);
                      }).destroy();
 var updateNotify = await collection.UserNotificationModel.query(qb => {
                           qb.where('user_id',receiveUserId);
                           qb.where('follower_id',requestUserId);
                           qb.whereNull('post_id');
                      }).destroy();
} catch (e) {
  console.log(e);
}
 return;
};


var getFollowers = async(req, res) => {
  req.assert('type','type is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
  var jsonOutput = []; 
  var posts = [];
  var followersObj = {};
  var userId = await getUserId(req.query.session_id);
  try{
  if(req.query.type == constants.GET_FOLLOWERS){
  var followers = await collection.UserFollowers.query(qb => {
                   qb.leftJoin('users','users.id','user_followers.follower_id');
                   qb.leftJoin('user_mood','user_mood.user_id','users.id');
                   qb.leftJoin('moods','moods.id','user_mood.mood_id');
                   qb.where(qb => {
                     qb.where(qb => {
                       qb.whereNotIn('user_followers.follower_id',(qb) => {
                         qb.from('user_blocked');
                         qb.where('user_blocked.user_id',userId);
                         qb.select('user_blocked.blocked_user_id');
                       });
                     });
                     qb.where(qb => {
                       qb.whereNotIn('user_followers.follower_id',(qb) => {
                         qb.from('user_blocked');
                         qb.where('user_blocked.blocked_user_id',userId);
                         qb.select('user_blocked.user_id');
                       });
                     });
                   });
                   qb.where('user_followers.followed_id',userId);
                   qb.where('users.is_trashed','!=',constants.IS_TRASHED);
                   qb.where('users.is_blocked','!=',constants.IS_BLOCKED);
                 }).fetch({columns : ['users.id', 'users.image' , 'users.full_name' , 'users.username','user_mood.mood_id','users.country','users.country_code',
                                      'users.phone_number','users.city','users.email','users.password','users.age','users.is_verified','user_mood.mood_id',
                                      'moods.name','moods.emoji','moods.color']});
} else {
   var followers = await collection.UserFollowers.query(qb => {
                   qb.leftJoin('users','users.id','user_followers.followed_id');
                   qb.leftJoin('user_mood','user_mood.user_id','users.id');
                   qb.leftJoin('moods','moods.id','user_mood.mood_id');
                   qb.where('user_followers.follower_id',userId);
                   qb.where(qb => {
                     qb.where(qb => {
                       qb.whereNotIn('user_followers.followed_id',(qb) => {
                         qb.from('user_blocked');
                         qb.where('user_blocked.user_id',userId);
                         qb.select('user_blocked.blocked_user_id');
                       });
                     });
                     qb.where(qb => {
                       qb.whereNotIn('user_followers.followed_id',(qb) => {
                         qb.from('user_blocked');
                         qb.where('user_blocked.blocked_user_id',userId);
                         qb.select('user_blocked.user_id');
                       });
                     });
                   });
                   qb.where('users.is_trashed','!=',constants.IS_TRASHED);
                   qb.where('users.is_blocked','!=',constants.IS_BLOCKED);
                 }).fetch({columns : ['users.id', 'users.image' , 'users.full_name' , 'users.username','user_mood.mood_id','users.country','users.country_code',
                                      'users.phone_number','users.city','users.email','users.password','users.age','users.is_verified','user_mood.mood_id',
                                      'moods.name','moods.emoji','moods.color']}); 
                 console.log(followers);
}
  } catch (e) {
    console.log(e);
  }

  for(var i = 0; i < followers.length; i++){
      var userProfile = await userMysql.getUserProfile(followers.models[i], null , null , userId);
      jsonOutput.push(userProfile);
  }
   
  // var jsonOutput = await followerMysql.getUsersOutput(followers,userId);
  return jsonOutput;
}
};


var getUserId = async(sessionId) => {
  var appLogin = await collection.AppLoginModel.query({where : {session_id : sessionId}}).fetch();
  return appLogin.attributes.user_id;
}

module.exports = {
  sendFollowRequest,
  getFollowers
}
