const collection = require('./../../Database/Collections');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const libFunction = require('./../../Library/functions');
const timeFunction = require('./../../Library/TimeFunctions');
const constants = require('./../../Library/Constants');
const push = require('./../../Library/Helpers/FCM');
const userMysql = require('./../../Library/CommonQueries/Users');
const postMysql = require('./../../Library/CommonQueries/Posts');
const followMysql = require('./../../Library/CommonQueries/Followers');

var fetchFollowRequest = async(req, res) => {
  try{
  var userId = await getUserId(req.query.session_id);

  var followRequests = await collection.UserFollowRequests.query(qb => {
                          qb.leftJoin('users','users.id','user_follow_requests.request_user_id');
                          qb.leftJoin('user_mood','user_mood.user_id','users.id');
                          qb.where('user_follow_requests.receive_user_id',userId);
                          qb.where(qb => {
                            qb.where(qb => {
                              qb.whereNotIn('user_follow_requests.request_user_id',(qb) => {
                                qb.from('user_blocked');
                                qb.where('user_blocked.user_id',userId);
                                qb.select('user_blocked.blocked_user_id');
                              });
                            });
                            qb.where(qb => {
                              qb.whereNotIn('user_follow_requests.request_user_id',(qb) => {
                                qb.from('user_blocked');
                                qb.where('user_blocked.blocked_user_id',userId);
                                qb.select('user_blocked.user_id');
                              });
                            });
                          });
                          qb.where('user_follow_requests.status',constants.FOLLOW_REQUEST_SEND);
                       }).fetch({columns : ['users.id', 'users.image' , 'users.full_name','users.username','user_mood.mood_id']});
  var jsonOutput = await followMysql.getUsersOutput(followRequests,userId);
  return jsonOutput;
} catch(e) {
  console.log(e);
}
};

var getRequestsOutput = async(followRequests) => {
  var requests = [];
  for(var i = 0 ; i< followRequests.length ; i++){
    var user = {};
    var image = await userMysql.getImageUrl(followRequests.models[i].attributes.image);
    user.user_id = followRequests.models[i].attributes.id;
    user.image = image;
    user.full_name = followRequests.models[i].attributes.full_name;
    requests.push(user);
  }
  return requests;
};

var getNotifications = async(req, res) => {
  var userId = await getUserId(req.query.session_id);	
  try{
  var notifications = await collection.UserNotification.query(qb => {
                       qb.leftJoin('users as followers','followers.id','user_notification.follower_id');
                       qb.leftJoin('users','users.id','user_notification.action_by_id');
                       qb.leftJoin('user_posts','user_posts.id','user_notification.post_id');
                       qb.where('user_notification.user_id',userId);
                       qb.orderBy('user_notification.id','DESC');
                      }).fetch({columns : ['followers.id as follower_id','followers.image as follower_image','followers.username as followers_name',
                                           'users.id as user_id','users.image as user_image','users.username as user_name','user_posts.id as post_id',
                                           'user_posts.media','user_notification.type','user_notification.created_at','user_posts.timezone']});
   } catch (e) {
   	console.log(e);
   }

   var jsonOutput = await getNotificationsOutput(notifications,userId,req.query.timezone); 
   return jsonOutput;                 
};

var getNotificationsOutput = async(notifications,userId,timezone) => {
	try{
  var notificationsOutput = [];
  for(var i = 0 ; i < notifications.length ; i++){
     var notificationsObj = {};
     var timezone = timezone ? timezone : notifications.models[i].attributes.timezone;


     switch(notifications.models[i].attributes.type) {

     	case constants.NOTIFICATION_NEW_FOLLOW_REQUEST : 
     	  var user = await userMysql.getUserInfo(notifications.models[i].attributes.follower_id);
        var user = await userMysql.getUserProfile(user, null, null, userId);
       
     	  notificationsObj.user = user;
        notificationsObj.post = {};
        notificationsObj.time_since = await timeFunction.getTimeSince(notifications.models[i].attributes.created_at, timezone);
     	  notificationsObj.notification = notifications.models[i].attributes.followers_name + ' has requested to followed you.';
        //notificationsObj.follow_type = notifications.models[i].attributes.type;
        notificationsObj.notification_type = constants.PUSH_TYPE_FOLLOW_REQUESTS;

     	break;

     	case constants.NOTIFICATION_FOLLOW_REQUEST_ACCEPTED :
        var user = await userMysql.getUserInfo(notifications.models[i].attributes.follower_id);
        var user = await userMysql.getUserProfile(user, null, null, userId);

        notificationsObj.user = user;
        notificationsObj.post = {};
        notificationsObj.time_since = await timeFunction.getTimeSince(notifications.models[i].attributes.created_at, timezone);
     	  notificationsObj.notification = notifications.models[i].attributes.followers_name + ' started following you.';
        notificationsObj.notification_type = constants.PUSH_TYPE_FOLLOW_REQUESTS;
        // notificationsObj.follow_type = notifications.models[i].attributes.type;

     	break;

     	case constants.NOTIFICATION_POST_COMMENT : 
        var user = await userMysql.getUserInfo(notifications.models[i].attributes.user_id);
        var user = await userMysql.getUserProfile(user, null, null, userId);

        var post = await postMysql.getPost(notifications.models[i].attributes.post_id);
        var post = await postMysql.getPostsObject(post);

        notificationsObj.user = user;
     	  notificationsObj.post = post;
     	  //notificationsObj.media = constants.POST_IMAGE_PATH + notifications.models[i].attributes.media;
        notificationsObj.time_since = await timeFunction.getTimeSince(notifications.models[i].attributes.created_at, timezone);
     	  notificationsObj.notification = notifications.models[i].attributes.user_name + ' commented on your post.';
        //notificationsObj.follow_type = 0;
        notificationsObj.notification_type = constants.PUSH_TYPE_POST;

     	break;

     	case constants.NOTIFICATION_POST_LIKE :
        var user = await userMysql.getUserInfo(notifications.models[i].attributes.user_id);
        var user = await userMysql.getUserProfile(user, null, null, userId);

        var post = await postMysql.getPost(notifications.models[i].attributes.post_id);
        var post = await postMysql.getPostsObject(post);

        notificationsObj.user = user;
        notificationsObj.post = post;
     	  notificationsObj.media = constants.POST_IMAGE_PATH + notifications.models[i].attributes.media;
        notificationsObj.time_since = await timeFunction.getTimeSince(notifications.models[i].attributes.created_at, timezone);
     	  notificationsObj.notification = notifications.models[i].attributes.user_name + ' liked your post.';
        //notificationsObj.follow_type = 0;
        notificationsObj.notification_type = constants.PUSH_TYPE_POST;

     	break;
     }
     notificationsOutput.push(notificationsObj);
  }
  return notificationsOutput;
} catch (e) {
	console.log(e);
}

};


var getUserId = async(sessionId) => {
  var appLogin = await collection.AppLoginModel.query({where : {session_id : sessionId}}).fetch();
  return appLogin.attributes.user_id;
}

module.exports = {
  fetchFollowRequest,
  getNotifications
}
