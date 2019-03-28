const collection = require('./../../Database/Collections');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');
const push = require('./../../Library/Helpers/FCM');
const userMysql = require('./../../Library/CommonQueries/Users');
const moodMysql = require('./../../Library/CommonQueries/Moods');
const postMySql = require('./../../Library/CommonQueries/Posts');

var getUsersOutput = async(users,userId) => {
  try{
  var followersOutput = [];
  var posts = [];
  for(var i = 0; i < users.length ; i++) {
    var json = {};
    var user = {};
    var image = await userMysql.getImageUrl(users.models[i].attributes.image);
    var isFollowed = await checkIfFollowed(users.models[i].attributes.id , userId);
    var status = await checkFollowerStatus(users.models[i].attributes.id , userId);
    var mood = await moodMysql.getMoodInfo(users.models[i].attributes.mood_id);

    user.user_id = users.models[i].attributes.id;
    user.image = image;
    user.username = users.models[i].attributes.username;
    user.full_name = users.models[i].attributes.full_name;
    user.status = status;
    //user.followed_by_me = isFollowed;
    user.mood_id = users.models[i].attributes.mood_id;
    user.mood_name = mood.attributes.name;
    user.mood_color = mood.attributes.color;
    user.mood_image = constants.EMOJI_IMAGE_PATH + mood.attributes.emoji

    json.profile = user;
    json.total_posts = await postMySql.getTotalPosts(users.models[i].attributes.id);
    json.posts = posts;
    followersOutput.push(json);
  }
  return followersOutput;
} catch (e) {
  console.log(e);
}
};

var checkFollowerStatus = async(followerId , userId) => {
  var followStatus = await collection.UserFollowRequestsModel.query(qb => {
                        qb.where(qb => {
                          qb.where('request_user_id',userId);
                          qb.where('receive_user_id',followerId);
                        });
                     }).fetch();

  var requestReceievd = await collection.UserFollowRequestsModel.query(qb => {
                          qb.where(qb => {
                            qb.where('request_user_id',followerId);
                            qb.where('receive_user_id',userId);
                            qb.where(qb => {
                               qb.where('status',constants.FOLLOW_REQUEST_SEND);
                            });
                          });
                        }).fetch();
  
  if(followStatus!=null || requestReceievd!=null){
    if(requestReceievd!=null){
      var status = constants.FOLLOW_STATUS_REQUEST_RECEIVED;
    } else if(followStatus.attributes.status == constants.FOLLOW_REQUEST_SEND){
      var status = constants.FOLLOW_STATUS_REQUEST_SENT;
    } else if(followStatus.attributes.status == constants.FOLLOW_REQUEST_ACCEPTED){
      var status = constants.FOLLOW_STATUS_FOLLOWING;
    } else {
      var status = constants.FOLLOW_STATUS_NOT_FOLLOWING;
    }
  }
  else{
    var status = constants.FOLLOW_STATUS_NOT_FOLLOWING;
  }
  return status;
};

var checkIfFollowed = async(followerId, userId) => {
  if(await collection.UserFollowersModel.query({where : {follower_id : userId, followed_id : followerId}}).fetch() != null){
    return 1;
  } else {
    return 0;
  }
};

var getFollowersbyMood = async (userId,moodId) => {
  var followers = await collection.UserFollowers.query(qb => {
                   qb.leftJoin('users','users.id','user_followers.followed_id');
                   qb.leftJoin('user_mood','user_mood.user_id','users.id');
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
                   // qb.where('user_mood.mood_id',moodId);
                 }).fetch({columns : ['users.id','user_mood.mood_id']}); 
  return followers;               
};

module.exports = {
  checkFollowerStatus,
  checkIfFollowed,
  getUsersOutput,
  getFollowersbyMood
}
