const collection = require('./../../Database/Collections');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');
const timeFunction = require('./../../Library/TimeFunctions');
const userMysql = require('./Users');
const moodMysql = require('./Moods');

var getPostsOutput = async(posts,timezone=null,commentsRequired = 0) => {
  try{
  var jsonOutput = [];
  for(var i = 0 ; i < posts.length ; i++){
    var postsOutput = {};
    var checkPost = await checkPostDuration(posts.models[i].attributes.id);
    if(checkPost){
      postsOutput = await getPostsObject(posts.models[i],timezone,commentsRequired);   
      jsonOutput.push(postsOutput);
    }
  }
  return jsonOutput;
} catch (e) {
  console.log(e);
}
};

var getPostsObject = async (posts,timezone=null,commentsRequired=0) => {
var postsOutput = {};
var outputComments = {};
    var moodInfo = {};
    var media = '';
    var userImage = '';
    var timezone = timezone ? timezone : posts.attributes.timezone;
    var numComments = await getTotalComments(posts.attributes.id);
    var numLikes = await getTotallikes(posts.attributes.id);
    var numViews = await getTotalViews(posts.attributes.id);
    var numShares = await getTotalShares(posts.attributes.id);

    if(posts.attributes.mood_id){
      var moodInfo = await moodMysql.getMoodInfo(posts.attributes.mood_id);
    }
   
    var timeDifference = await timeFunction.getTimeDifference(posts.attributes.created_at, timezone);
    // if(timeDifference > 1){
    //    var timeAgo = await timeFunction.getDate(posts.models[i].attributes.created_at, timezone,constants.POST_DATE_FORMAT);
    // }
    // else{
       var timeAgo = await timeFunction.getTimeSince(posts.attributes.created_at, timezone);
    // }
    
    if(commentsRequired){
       var comments = await getPostComments(posts.attributes.id,timezone);
       outputComments.comments = comments;
    }
    if(posts.attributes.image){
        userImage = await getImageUrl(posts.attributes.image);
    }
 
    if(posts.attributes.media){
       media = await getPostUrl(posts.attributes.media,posts.attributes.type);
    }
    // var media = posts.models[i].attributes.media ? constants.POST_IMAGE_PATH + posts.models[i].attributes.media : ''

    //check if post is by admin
    var postByAdmin = await checkIfAdmin(posts.attributes.id);

    postsOutput.id = posts.attributes.id;
    postsOutput.post_type = posts.attributes.type;
    postsOutput.title = posts.attributes.title ? posts.attributes.title : '';
    postsOutput.description = posts.attributes.description ? posts.attributes.description : '';
    postsOutput.youtube_video_id = posts.attributes.youtube_video_id ? posts.attributes.youtube_video_id : '';
    postsOutput.youtube_video_title = posts.attributes.youtube_video_title ? posts.attributes.youtube_video_title : '';
    postsOutput.youtube_video_description = posts.attributes.youtube_video_description ? posts.attributes.youtube_video_description : '';
    postsOutput.media = media;
    postsOutput.video_thumb = posts.attributes.video_thumb ? constants.POST_VIDEO_THUMB_PATH + posts.attributes.video_thumb : '';
    postsOutput.youtube_video_thumb = posts.attributes.youtube_video_thumb ? posts.attributes.youtube_video_thumb : '';
    postsOutput.gif_image_url = posts.attributes.gif_image_url ? posts.attributes.gif_image_url : '';
    postsOutput.time_since = timeAgo;
    postsOutput.total_likes = numLikes;
    postsOutput.total_comments = numComments;
    postsOutput.total_shares = numShares;
    postsOutput.total_views = numViews;
    postsOutput.user_id =  posts.attributes.user_id ? posts.attributes.user_id : 0;
    postsOutput.user_image = userImage;
    postsOutput.user_name = posts.attributes.username ? posts.attributes.username : '';
    postsOutput.mood_id = moodInfo.attributes ? moodInfo.attributes.id : 1;
    postsOutput.mood_name = moodInfo.attributes ? moodInfo.attributes.name : 'Happy';
    postsOutput.mood_color = moodInfo.attributes ? moodInfo.attributes.color : '#3942FF';
    postsOutput.mood_image = moodInfo.attributes ? constants.EMOJI_IMAGE_PATH + moodInfo.attributes.emoji : constants.EMOJI_IMAGE_PATH + 'ic_happy.png';
    postsOutput.is_admin_post = postByAdmin ? 1 : 0;

    if(commentsRequired){
       outputComments.post = postsOutput;
       return outputComments;
    }
    return postsOutput;
};

var checkIfAdmin = async (postId) => {
  var isByAdmin = await collection.UserPostsModel.query(qb => {
                    qb.where('id',postId);
                  }).fetch();
  if(isByAdmin.attributes.is_by_admin == constants.POST_BY_ADMIN){
    return true;
  } else {
    return false;
  }
};

var getPostUrl = async (media, postType) => {
  if(postType == constants.POST_VIDEO) {
      var url = constants.S3_BUCKET_PATH + constants.S3_POST_VIDEOS + '/' + media;
  } else if(postType == constants.POST_IMAGE) {
      var url = constants.POST_IMAGE_PATH + media;
  } else if(postType == constants.POST_GIF) {
      var url = constants.S3_BUCKET_PATH + constants.S3_POST_GIF + '/' + media;
  }
  return url;
}

var getTotalComments  = async(postId) => {
  var comments = await collection.PostComments.query(qb => {
                   qb.where('post_comments.post_id',postId);
                 }).count();
  return comments;
}

var getTotallikes = async(postId) => {
  var likes = await collection.PostLikes.query(qb => {
                   qb.where('post_likes.post_id',postId);
                 }).count();
  return likes;
}

var getTotalViews = async(postId) => {
  var views = await collection.PostViews.query(qb => {
                   qb.where('post_views.post_id',postId);
                 }).count();
  return views;
}

var getTotalShares = async(postId) => {
  var shares = await collection.UserPostShare.query(qb => {
                   qb.where('user_post_share.post_id',postId);
                 }).count();

  return shares;
}

var getTotalReports = async(postId) => {
  var reports = await collection.UserReportPostModel.query(qb => {
                   qb.where('post_id',postId);
                 }).count();

  return reports;
}

var getPostComments = async(postId, timezone) => {
  var comments = await collection.PostComments.query(qb => {
                     qb.leftJoin('users','post_comments.user_id','users.id');
                     qb.where('post_comments.post_id',postId);
                   }).fetch({columns : ['post_comments.comment','users.image','users.username','post_comments.created_at','post_comments.timezone',
                                        'post_comments.user_id','post_comments.id']});
  var postComments = await getCommentsOutput(comments,timezone);
  return postComments;
};

var getCommentsOutput = async(comments, timezone=null) => {
  try{
  var postComments = [];
  for(var i = 0; i < comments.length ; i++){
    var userComments = await getCommentsObject(comments.models[i]);
    postComments.push(userComments);
  }
  return postComments;
} catch (e) {
  console.log(e);
}
};

var getCommentsObject = async(comments) => {
    var userComments = {};
    // var timezone = timezone ? timezone : comments.attributes.timezone;
    var timeSince = await timeFunction.getTimeSince(comments.attributes.created_at);
    var image = await getImageUrl(comments.attributes.image);

    var mood = await moodMysql.getCurrentMood(comments.attributes.user_id);
    var moodInfo = await moodMysql.getMoodInfo(mood.attributes.mood_id);
    
    userComments.id = comments.attributes.id;
    userComments.user_id = comments.attributes.user_id;
    userComments.comment = comments.attributes.comment;
    userComments.user_image = image;
    userComments.user_name = comments.attributes.username;
    userComments.time_since = timeSince;
    userComments.mood_color = moodInfo.attributes.color;
    return userComments;
};

var getPost = async(postId) => {
var post = await collection.UserPostsModel.query(qb => {
               qb.leftJoin('users','user_posts.user_id','users.id');
               qb.leftJoin('user_mood','user_mood.user_id','user_posts.user_id');
               qb.where('user_posts.is_deleted','!=',constants.IS_POST_DELETED);
               qb.where('user_posts.is_removed','!=',constants.IS_POST_REMOVED);
               qb.where('user_posts.id',postId);
             }).fetch({columns : ['user_posts.id', 'user_posts.title' , 'user_posts.description' , 'user_posts.media' , 'user_posts.is_by_admin','user_posts.created_at',
                                  'users.full_name' ,'users.image' , 'user_posts.timezone','user_mood.mood_id','users.username','user_posts.type','user_posts.video_thumb',
                                  'user_posts.gif_image_url','user_posts.youtube_video_title','user_posts.youtube_video_id','user_posts.youtube_video_description',
                                  'user_posts.youtube_video_thumb','user_posts.user_id']});
 return post;            
};

var getTotalPosts = async(userId) => {
  var posts = await collection.UserPosts.query(qb => {
                qb.where('user_id',userId);
                qb.where('user_posts.is_deleted','!=',constants.IS_POST_DELETED);
                qb.where('user_posts.is_removed','!=',constants.IS_POST_REMOVED);
              }).count();
  return posts;
};

var checkPostDuration = async(postId) => {
  var isVisible = await collection.UserPostsModel.query({where : {id : postId}}).fetch();
  if(isVisible.attributes.post_duration == 1){
    return true;
  } else {
    var days = timeFunction.getNumberOfDays(isVisible.attributes.created_at);
    if(days > 5){
      return false;
    } else {
      return true;
    }
  }
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
  getPostsOutput,
  getPostComments,
  getCommentsObject,
  getPost,
  getTotalPosts,
  getPostsObject,
  getTotalViews,
  getTotallikes,
  getTotalShares,
  getTotalComments,
  getTotalReports
}
