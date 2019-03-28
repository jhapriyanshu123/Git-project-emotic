const randomString = require('randomstring');

const collection = require('./../../Database/Collections');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');
const push = require('./../../Library/Helpers/FCM');
const postMySql = require('./../../Library/CommonQueries/Posts');
const moodMySql = require('./../../Library/CommonQueries/Moods');
const followerMySql = require('./../../Library/CommonQueries/Followers');

var getUserProfile = async (result, sessionId=null, requirePosts=null, currentUserId=null) => {
  try{
var userProfile = {};
var profile = {};
var status = 0;
var image = '';
if(result.attributes.image!=null){
  var image = result.attributes.image;
  var image = await getImageUrl(image);
}
var numFollowers = await getTotalFollowers(result.attributes.id);
var numFollowing = await getTotalFollowing(result.attributes.id);
var totalPosts = await postMySql.getTotalPosts(result.attributes.id);
if(currentUserId!=null){
   status = await followerMySql.checkFollowerStatus(result.attributes.id , currentUserId);
}

var mood = await moodMySql.getCurrentMood(result.attributes.id);
var moodInfo = await moodMySql.getMoodInfo(mood.attributes.mood_id);

profile.id = result.attributes.id;
profile.username = result.attributes.username ? result.attributes.username : '';
profile.full_name = result.attributes.full_name ? result.attributes.full_name : '';
profile.email = result.attributes.email ? result.attributes.email : '';
profile.country = result.attributes.country ? result.attributes.country : '';
profile.city = result.attributes.city ? result.attributes.city : '';
profile.country_code = result.attributes.country_code ? result.attributes.country_code : '';
profile.phone_number = result.attributes.phone_number ? result.attributes.phone_number : '';
profile.age = result.attributes.age;
profile.mood_id = result.attributes.mood_id ? result.attributes.mood_id : moodInfo.attributes.id;
profile.mood_name = result.attributes.name ? result.attributes.name : moodInfo.attributes.name;
profile.mood_image = result.attributes.emoji ? constants.EMOJI_IMAGE_PATH + result.attributes.emoji : constants.EMOJI_IMAGE_PATH + moodInfo.attributes.emoji;
profile.mood_color = result.attributes.color ? result.attributes.color : moodInfo.attributes.color;
profile.image = image;
profile.status = status;
profile.can_change_password = result.attributes.password ? 1 : 0;
profile.followers_count = numFollowers;
profile.following_count = numFollowing;

if(sessionId){
 userProfile.session_id = sessionId; 
 userProfile.profile = profile;
 return userProfile;
}
else if(requirePosts){
 userProfile.profile = profile;
 userProfile.total_posts = totalPosts;
 return userProfile;
} else {
  return profile;
}
} catch (e) {
  console.log(e);
}
};

var getTotalFollowers = async(userId) => {
  var followers = await collection.UserFollowers.query(qb => {
                   qb.leftJoin('users','users.id','user_followers.follower_id');
                   //qb.leftJoin('user_blocked','user_blocked.blocked_user_id','user_followers.follower_id');
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
                 }).count();

  return followers;
};

var getTotalFollowing = async(userId) => {
  var following = await collection.UserFollowers.query(qb => {
                   qb.leftJoin('users','users.id','user_followers.followed_id');
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
                   });                   qb.where('users.is_trashed','!=',constants.IS_TRASHED);
                   qb.where('users.is_blocked','!=',constants.IS_BLOCKED);
                 }).count();
  return following;
};


var getAppLogin = async (req, userId) => {
var sessionId = randomString.generate(32);

// if(await collection.AppLoginModel.query({where : {user_id : userId}}).fetch()){
//   var insert =  await collection.AppLoginModel.query({where : {user_id : userId}}).save({session_id : sessionId, device_token : req.body.device_type,
//                 device_type : req.body.device_type , device_id : req.body.device_id} , {patch : true, require : false});
// }
// else{
  var insert =  await collection.AppLoginModel.forge({user_id: userId, device_token: req.body.device_token,session_id : sessionId,
                                                      device_type: req.body.device_type, device_id: req.body.device_id}).save();
// }

if(insert.err){
  console.log(err);
}
else{
  return sessionId;
}
};

var getUserInfo = async(userId) => {
  var user = await collection.UsersModel.query(qb => {
               qb.where('users.id',userId);
               qb.leftJoin('user_mood','user_mood.user_id','users.id');
               qb.leftJoin('moods','moods.id','user_mood.mood_id');
               qb.where('users.is_trashed','!=',constants.IS_TRASHED);
               qb.where('users.is_blocked','!=',constants.IS_BLOCKED);
             }).fetch({columns : ['users.id' ,'users.full_name', 'users.email' , 'users.country','users.password' , 'users.phone_number' , 'users.image','users.password',
                                  'users.age' , 'users.city','users.username' , 'users.country_code', 'users.is_verified' ,'user_mood.mood_id','moods.name','moods.emoji','moods.color']});
  return user;
};

var checkBlocked = async(userId, blockedId) => {
  try{
  var isBlocked = await collection.UserBlockedModel.query(qb => {
                    qb.where(qb => {
                      qb.where('user_id',userId);
                      qb.where('blocked_user_id',blockedId);
                    });   
                    qb.orWhere(qb => {
                      qb.where('user_id',blockedId);
                      qb.where('blocked_user_id',userId);
                    });                                      
                  }).fetch();
  if(isBlocked!=null){
    return true;
  } else {
    return false;
  }
} catch (e) {
  console.log(e);
}
}

var notifyReceiver = async(userId,data,username) => {
var tokens = await collection.AppLogin.query(qb => {
              qb.where('user_id',userId);
              qb.whereNotNull('device_token');
             }).fetch();
if(tokens!=null){
  for(var i = 0; i < tokens.length ; i++){
    if(tokens.models[i].attributes.device_token){
      var sendPush = await push.sendPush(tokens.models[i].attributes.device_token,data,tokens.models[i].attributes.device_type,username);
    }
  }
}
return;
};

var getImageUrl = async(image) => {
  if(image!=null){
   var containsHttp = image.includes('http');
   var containsHttps = image.includes('https');
   if (containsHttp === true || containsHttps === true) {
     var image = image;
   } else {
     var image = constants.USER_IMAGE_PATH + image;
   }
  }
  return image;
};

module.exports = {
  notifyReceiver,
  getAppLogin,
  getUserInfo,
  getImageUrl,
  getUserProfile,
  getTotalFollowing,
  getTotalFollowers,
  checkBlocked
}
