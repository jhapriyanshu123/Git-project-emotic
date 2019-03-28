const collection = require('./../../Database/Collections');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');
const timeFunction = require('./../../Library/TimeFunctions');
const postMySql = require('./../../Library/CommonQueries/Posts');

var getFeed = async(req, res) => {
    var userId = await getUserId(req.query.session_id);
    var limit = req.query.limit ? req.query.limit : 10;
    var skip = req.query.page ? (req.query.page-1) * limit : 0
 
    if(req.query.type == constants.FRIENDS_FEED) {
      var posts = await getFriendsFeed(userId,limit,skip);
    }
    // } else if(req.query.type == constants.MOOD_FEED) {
    //   var posts = await getMoodFeed(userId,limit,skip);
    // } 
    else {
      var posts = await getGlobalFeed(userId,limit,skip);
    }
  
    var jsonOutput = await postMySql.getPostsOutput(posts,req.query.timezone);
    return jsonOutput;
  };

var getGlobalFeed = async(userId,limit,skip) => {
  try{
  var currentMood = await getUserMood(userId);
  var posts = await collection.UserPosts.query(qb => {
               qb.leftJoin('users','user_posts.user_id','users.id');
               qb.leftJoin('user_mood','user_mood.user_id','users.id');
               qb.leftJoin('post_mood','post_mood.post_id','user_posts.id');
               qb.where(qb => {
                 qb.where(qb => {
                   qb.whereNotIn('user_posts.user_id',(qb) => {
                     qb.from('user_blocked');
                     qb.where('user_blocked.user_id',userId);
                     qb.select('user_blocked.blocked_user_id');
                   });
                 });
                 qb.where(qb => {
                   qb.whereNotIn('user_posts.user_id',(qb) => {
                     qb.from('user_blocked');
                     qb.where('user_blocked.blocked_user_id',userId);
                     qb.select('user_blocked.user_id');
                   });
                 });
               });
               qb.whereNotIn('user_posts.id',(qb) => {
                 qb.from('user_hide_posts');
                 qb.where('user_hide_posts.user_id',userId);
                 qb.select('user_hide_posts.post_id');
               });
               qb.where('post_mood.mood_id',currentMood);
               qb.whereRaw('DATEDIFF(NOW(),user_posts.created_at) <= 5');
               qb.where('user_posts.is_deleted','!=',constants.IS_POST_DELETED);
               qb.where('user_posts.is_removed','!=',constants.IS_POST_REMOVED);
               qb.where('user_posts.is_by_admin','!=',constants.POST_BY_ADMIN);
               qb.offset(skip);
               qb.limit(limit);
               qb.groupBy('user_posts.id');
               qb.orderBy('id','DESC');
             }).fetch({columns : ['user_posts.id', 'user_posts.title' , 'user_posts.description' , 'user_posts.media' , 'user_posts.is_by_admin','user_posts.created_at',
                                  'users.username' ,'users.image' , 'user_posts.timezone','user_mood.mood_id','user_posts.type','users.id as user_id','user_posts.youtube_video_title',
                                  'user_posts.youtube_video_description','user_posts.youtube_video_id','user_posts.youtube_video_thumb','user_posts.video_thumb','user_posts.gif_image_url']});
           } catch (e){
            console.log(e);
           }
  return posts;
}

var getFriendsFeed = async(userId,limit,skip) => {
  var posts = await collection.UserPosts.query(qb => {
               qb.leftJoin('users','user_posts.user_id','users.id');
               qb.leftJoin('user_mood','user_mood.user_id','users.id');
               qb.leftJoin('user_followers','user_followers.followed_id','users.id');
               qb.where(qb => {
                 qb.where(qb => {
                   qb.whereNotIn('user_posts.user_id',(qb) => {
                     qb.from('user_blocked');
                     qb.where('user_blocked.user_id',userId);
                     qb.select('user_blocked.blocked_user_id');
                   });
                 });
                 qb.where(qb => {
                   qb.whereNotIn('user_posts.user_id',(qb) => {
                     qb.from('user_blocked');
                     qb.where('user_blocked.blocked_user_id',userId);
                     qb.select('user_blocked.user_id');
                   });
                 });
               });
               qb.whereNotIn('user_posts.id',(qb) => {
                 qb.from('user_hide_posts');
                 qb.where('user_hide_posts.user_id',userId);
                 qb.select('user_hide_posts.post_id');
               });
               qb.where('user_posts.is_deleted','!=',constants.IS_POST_DELETED);
               qb.where('user_posts.is_removed','!=',constants.IS_POST_REMOVED);
               qb.where('user_followers.follower_id',userId);
               qb.where('user_posts.is_by_admin','!=',constants.POST_BY_ADMIN);
               qb.whereRaw('DATEDIFF(NOW(),user_posts.created_at) <= 5');
               qb.offset(skip);
               qb.limit(limit);
               qb.groupBy('user_posts.id');
               qb.orderBy('id','DESC');
             }).fetch({columns : ['user_posts.id', 'user_posts.title' , 'user_posts.description' , 'user_posts.media' , 'user_posts.is_by_admin','user_posts.created_at',
                                  'users.username' ,'users.image', 'user_posts.timezone','user_mood.mood_id','user_posts.type','users.id as user_id','user_posts.youtube_video_title',
                                  'user_posts.youtube_video_description','user_posts.youtube_video_id','user_posts.youtube_video_thumb','user_posts.video_thumb','user_posts.gif_image_url']});
  return posts;
}

var getMoodFeed = async(userId,limit,skip) => {
  try{
  var posts = await collection.UserPosts.query(qb => {
               qb.leftJoin('users','user_posts.user_id','users.id');
               qb.leftJoin('user_mood','user_mood.user_id','users.id');
               qb.whereNotIn('user_posts.id',(qb) => {
                 qb.from('user_hide_posts');
                 qb.where('user_hide_posts.user_id',userId);
                 qb.select('user_hide_posts.post_id');
               });
               qb.where('user_posts.is_deleted','!=',constants.IS_POST_DELETED);
               qb.where('user_posts.is_removed','!=',constants.IS_POST_REMOVED);
               qb.where('user_posts.is_by_admin',constants.POST_BY_ADMIN);
               qb.whereRaw('DATEDIFF(NOW(),user_posts.created_at) <= 5');
               qb.offset(skip);
               qb.limit(limit);
               qb.groupBy('user_posts.id');
               qb.orderBy('id','DESC');
             }).fetch({columns : ['user_posts.id', 'user_posts.title' , 'user_posts.description' , 'user_posts.media' , 'user_posts.is_by_admin','user_posts.created_at',
                                  'users.username' ,'users.image', 'user_posts.timezone','user_mood.mood_id','user_posts.type','users.id as user_id','user_posts.youtube_video_title',
                                  'user_posts.youtube_video_description','user_posts.youtube_video_id','user_posts.youtube_video_thumb','user_posts.video_thumb','user_posts.gif_image_url']});
  } catch (e) {
    console.log(e);
  }
  return posts;
}

var getUserMood = async(userId) => {
  var currentMood = await collection.UserMoodModel.query({where : {user_id : userId}}).fetch();
  return currentMood.attributes.mood_id;
};

var getUserId = async(sessionId) => {
  var appLogin = await collection.AppLoginModel.query({where : {session_id : sessionId}}).fetch();
  return appLogin.attributes.user_id;
}

module.exports = {
  getFeed
}
