const collection = require('./../../Database/Collections');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');
const userMysql = require('./../../Library/CommonQueries/Users');
const followerMysql = require('./../../Library/CommonQueries/Followers');
const postMySql = require('./../../Library/CommonQueries/Posts');

var searchUser = async(req, res) => {
    var jsonOutput = [];
    var posts = [];
    var userId = await getUserId(req.query.session_id);
    var searchQuery = req.query.keyword ? '%' + req.query.keyword + '%' : '';

    if(searchQuery){
      if(req.query.type == constants.SEARCH_FOLLOWERS) {
        var users = await getFollowersSearch(searchQuery,userId);
      } else if(req.query.type == constants.SEARCH_FOLLOWING) {
        var users = await getFollowingSearch(searchQuery,userId);
      } else {
        var users = await getHomeSearch(searchQuery,userId);
      }
    } else {
        var users = await getFollowingSearch(searchQuery,userId);
    }

    for(var i = 0; i < users.length; i++){
      var userObj = {};
      var userProfile = await userMysql.getUserProfile(users.models[i],null,null,userId);
      jsonOutput.push(userProfile);
    }
    // jsonOutput = await followerMysql.getUsersOutput(users,userId);

    return jsonOutput;
};

var getHomeSearch = async(searchQuery, userId) => {
  try{
  var users = await collection.Users.query(qb => {
                 qb.where(qb => {
                   qb.where('username','like',searchQuery);
                   qb.orWhere('full_name','like',searchQuery);
                 });
                 qb.where('users.id','!=',userId);
                 qb.where(qb => {
                   qb.where(qb => {
                     qb.whereNotIn('users.id',(qb) => {
                       qb.from('user_blocked');
                       qb.where('user_blocked.user_id',userId);
                       qb.select('user_blocked.blocked_user_id');
                     });
                   });
                   qb.where(qb => {
                     qb.whereNotIn('users.id',(qb) => {
                       qb.from('user_blocked');
                       qb.where('user_blocked.blocked_user_id',userId);
                       qb.select('user_blocked.user_id');
                     });
                   });
                 });
                 qb.where('is_trashed','!=',constants.IS_TRASHED);
                 qb.where('is_blocked','!=',constants.IS_BLOCKED);
              }).fetch({columns : ['users.id', 'users.image' , 'users.full_name' , 'users.username','users.country','users.country_code',
                                   'users.phone_number','users.city','users.email','users.password','users.age','users.is_verified']});
} catch (e) {
  console.log(e);
}
  return users;
};

var getFollowersSearch = async(searchQuery, userId) => {
  try{
  var users = await collection.Users.query(qb => {
                 qb.leftJoin('user_followers','users.id','user_followers.follower_id');
                 qb.where(qb => {
                   qb.where('username','like',searchQuery);
                   qb.orWhere('full_name','like',searchQuery);
                 });
                 qb.where('users.id','!=',userId);
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
                 qb.where('is_trashed','!=',constants.IS_TRASHED);
                 qb.where('is_blocked','!=',constants.IS_BLOCKED);
              }).fetch({columns : ['users.id', 'users.image' , 'users.full_name' , 'users.username','users.country','users.country_code',
                                   'users.phone_number','users.city','users.email','users.password','users.age','users.is_verified',]});
} catch (e) {
  console.log(e);
}
  return users;
};

var getFollowingSearch = async(searchQuery, userId) => {
  try{
  var operator = searchQuery ? 'like' : '!=';

  var users = await collection.Users.query(qb => {
                 qb.leftJoin('user_followers','users.id','user_followers.followed_id');
                 qb.where(qb => {
                   qb.where('username',operator,searchQuery);
                   qb.orWhere('full_name',operator,searchQuery);
                 });
                 qb.where('users.id','!=',userId);
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
                 qb.where('user_followers.follower_id',userId);
                 qb.where('is_trashed','!=',constants.IS_TRASHED);
                 qb.where('is_blocked','!=',constants.IS_BLOCKED);
              }).fetch({columns : ['users.id', 'users.image' , 'users.full_name' , 'users.username','users.country','users.country_code',
                                   'users.phone_number','users.city','users.email','users.password','users.age','users.is_verified',]});
} catch (e) {
  console.log(e);
}
  return users;
};

var getPosts = async (req, res) => {
  try{
  var userId = await getUserId(req.query.session_id);
  var limit = req.query.limit ? req.query.limit : 10;
  var skip = req.query.page ? (req.query.page-1) * limit : 0
 
  var posts = await collection.UserPosts.query(qb => {
               qb.leftJoin('users','user_posts.user_id','users.id');
               // qb.leftJoin('post_mood','post_mood.post_id','user_posts.id');
               qb.leftJoin('user_mood','user_mood.user_id','users.id');
               // qb.where(qb => {
               //   qb.where(qb => {
               //     qb.whereNotIn('user_posts.user_id',(qb) => {
               //       qb.from('user_blocked');
               //       qb.where('user_blocked.user_id',userId);
               //       qb.select('user_blocked.blocked_user_id');
               //     });
               //   });
               //   qb.where(qb => {
               //     qb.whereNotIn('user_posts.user_id',(qb) => {
               //       qb.from('user_blocked');
               //       qb.where('user_blocked.blocked_user_id',userId);
               //       qb.select('user_blocked.user_id');
               //     });
               //   });
               // });
               qb.whereNotIn('user_posts.id',(qb) => {
                 qb.from('user_hide_posts');
                 qb.where('user_hide_posts.user_id',userId);
                 qb.select('user_hide_posts.post_id');
               });
               //qb.whereRaw('DATEDIFF(NOW(),user_posts.created_at) < 2');
               // qb.where('user_posts.user_id','!=',userId);
               qb.where('user_posts.is_deleted','!=',constants.IS_POST_DELETED);
               qb.where('user_posts.is_removed','!=',constants.IS_POST_REMOVED);
               qb.where('user_posts.is_by_admin',constants.POST_BY_ADMIN);
               qb.offset(skip);
               qb.limit(limit);
               qb.groupBy('user_posts.id');
               qb.orderBy('id','DESC');
             }).fetch({columns : ['user_posts.id', 'user_posts.title' , 'user_posts.description' , 'user_posts.media' , 'user_posts.is_by_admin','user_posts.created_at',
                                  'users.username' ,'users.image' , 'user_posts.timezone','user_posts.type','users.id as user_id','user_posts.youtube_video_title',
                                  'user_posts.youtube_video_description','user_posts.youtube_video_id','user_posts.youtube_video_thumb','user_posts.gif_image_url','user_posts.video_thumb']});

    var jsonOutput = await postMySql.getPostsOutput(posts,req.query.timezone);
    return jsonOutput;      
    } catch(e){
      console.log(e);
    }   
};


var getUserId = async(sessionId) => {
  var appLogin = await collection.AppLoginModel.query({where : {session_id : sessionId}}).fetch();
  return appLogin.attributes.user_id;
}

module.exports = {
  searchUser,
  getPosts
}
