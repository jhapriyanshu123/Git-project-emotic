const moment = require('moment');

const collection = require('./../../Database/Collections');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');
const timeFunction = require('./../../Library/TimeFunctions');
const postMySql = require('./../../Library/CommonQueries/Posts');
const groupMySql = require('./../../Library/CommonQueries/Groups');
const userMySql = require('./../../Library/CommonQueries/Users');
const chatMySql = require('./../../Library/CommonQueries/Chat');
const moodMySql = require('./../../Library/CommonQueries/Moods');
const followerMySql = require('./../../Library/CommonQueries/Followers');
const awsWorker = require('../AwsController');

var addPost = async(req, res) => {
  // req.checkBody('title','Title is required').notEmpty();
  req.checkBody('mood_id','Mood is required').notEmpty();
  req.checkBody('type','Post type is required').notEmpty();
  req.checkBody('post_duration','Post duration is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    try{
    var moods = JSON.parse(req.body.mood_id);
    if(!Array.isArray(moods)){
      throw 'Please enter mood id in valid format';
    }

    var userId = await getUserId(req.body.session_id);

    if(req.files.media){
    	var imageObj = await getImageObject(req.files.media);
        var timestamp = moment().unix();
        var image = timestamp + imageObj.originalname;
        if(req.body.type == constants.POST_VIDEO) {
          var folder = constants.S3_POST_VIDEOS;
        } else if(req.body.type == constants.POST_IMAGE) {
          var folder = constants.S3_POST_IMAGES;
        } else if(req.body.type == constants.POST_GIF) {
          var folder = constants.S3_POST_GIF;
        }
        var uploadImage = await awsWorker.doUpload(imageObj, image, folder);
    }
   
    if(req.files.video_thumb){
      var imageObj = await getImageObject(req.files.video_thumb);
      var thumb = timestamp + imageObj.originalname;
      if(req.body.type == constants.POST_VIDEO){
          var folder = constants.S3_POST_VIDEOS_THUMB;
          var uploadImage = await awsWorker.doUpload(imageObj, thumb, folder);
      }
    } 


    var media = req.files.media ? image : '';
    var thumb = req.files.video_thumb ? thumb : '';
    var moods = JSON.parse(req.body.mood_id);

    var newPost = await collection.UserPostsModel.forge({user_id : userId , mood_id : req.body.mood_id , title : req.body.title ,
        description : req.body.description, youtube_video_title : req.body.youtube_video_title, youtube_video_description : req.body.youtube_video_description,
        youtube_video_id : req.body.youtube_video_id ,youtube_video_thumb : req.body.youtube_video_thumb,media : media , timezone : req.body.timezone, type : req.body.type, video_thumb : thumb, 
        gif_image_url : req.body.gif_image_url,post_duration : req.body.post_duration}).save();

    for(var i = 0 ; i<moods.length; i++){
      var addPostMood = await collection.PostMoodModel.forge({post_id : newPost.attributes.id , mood_id : moods[i]}).save();
    }

    var post = await postMySql.getPost(newPost.attributes.id);
    var postObj = await postMySql.getPostsObject(post,req.body.timezone);
    var followers = await followerMySql.getFollowersbyMood(userId,req.body.mood_id);
    var user = await userMySql.getUserInfo(userId);

    var pushData = {};
    pushData.push_type = constants.PUSH_TYPE_POST;
    pushData.post = postObj;
    pushData.conversation = {};
    pushData.user = {};
    pushData.message_to_display = user.attributes.username + ' added a new post';

    for(var i = 0 ; i < followers.length ; i++){
      if(moods.includes(followers.models[i].attributes.mood_id)){
        var notifyUser = await userMySql.notifyReceiver(followers.models[i].attributes.id, pushData, user.attributes.username);
      }
   }

    var jsonOutput = {};
    jsonOutput.message = 'Your post has been added successfully';
    return jsonOutput;
  } catch (e) {
    console.log(e);
  }
  }
};

var getImageObject = async(reqImage) => {
  var image = {};
  for(var i = 0; i<reqImage.length ; i++){
    image.fieldname = reqImage[i].fieldname;
    image.originalname = reqImage[i].originalname;
    image.buffer = reqImage[i].buffer;
    image.encoding = reqImage[i].encoding;
    image.mimetype = reqImage[i].mimetype;
    image.size = reqImage[i].size;
  }
  return image;
};

var commentOnPost = async(req, res) => {
  req.checkBody('post_id','Post id is required').notEmpty();
  req.checkBody('comment','Comment is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    try{
    var userId = await getUserId(req.body.session_id);
    var createdAt = await timeFunction.convertDateTime();

    var newComment = await collection.PostCommentsModel.forge({user_id : userId , comment : req.body.comment , post_id : req.body.post_id,created_at : createdAt,timezone : req.body.timezone}).save();
    var postUser = await collection.UserPostsModel.query({where : {id : req.body.post_id}}).fetch();

    //notify user 
    var checkNotification = await collection.UserNotificationModel.query({where : {user_id : postUser.attributes.user_id ,post_id : req.body.post_id,
                            action_by_id : userId, type : constants.NOTIFICATION_POST_COMMENT}}).fetch();
    if(checkNotification!=null){
       var deletePrevious = await collection.UserNotificationModel.query({where : {id : checkNotification.attributes.id}}).destroy();
    }
    if(postUser.attributes.user_id != userId){
       var newNotification = await collection.UserNotificationModel.forge({user_id : postUser.attributes.user_id ,post_id : req.body.post_id,
                             action_by_id : userId, type : constants.NOTIFICATION_POST_COMMENT}).save();
    }

    var post = await postMySql.getPost(req.body.post_id);
    var postObj = await postMySql.getPostsObject(post,req.body.timezone);
    var user = await userMySql.getUserInfo(userId);

    if(userId != postUser.attributes.user_id){
      var pushData = {};
      pushData.push_type = constants.PUSH_TYPE_POST;
      pushData.post = postObj;
      pushData.conversation = {};
      pushData.user = {};
      pushData.message_to_display = user.attributes.username + constants.PUSH_MESSAGE_POST_COMMENT;

      var notifyUser = await userMySql.notifyReceiver(postUser.attributes.user_id, pushData, user.attributes.username);
    }
    
    var comments = await collection.PostCommentsModel.query(qb => {
                     qb.leftJoin('users','post_comments.user_id','users.id');
                     qb.where('post_comments.id',newComment.attributes.id);
                   }).fetch({columns : ['post_comments.comment','users.image','users.username','post_comments.created_at','post_comments.timezone',
                                        'post_comments.user_id','post_comments.id']});
    var comment = await postMySql.getCommentsObject(comments,userId);
    return comment;
  } catch (e) {
    console.log(e);
  }
  }
};

var likePost = async(req, res) => {
  req.checkBody('post_id','post id is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    try{
    var userId = await getUserId(req.body.session_id);
    var like = 0;
    var checkIfLiked = await collection.PostLikesModel.query({where : {user_id : userId, post_id : req.body.post_id}}).fetch();
    if(checkIfLiked!=null){ //unlike the post
      await collection.PostLikesModel.query({where : {user_id : userId, post_id : req.body.post_id, post_id : req.body.post_id}}).destroy();
    } else { //like the post
      var like = 1;
      var likePost = await collection.PostLikesModel.forge({user_id : userId , post_id : req.body.post_id}).save();
    }

    var postUser = await collection.UserPostsModel.query({where : {id : req.body.post_id}}).fetch();
    //notify user 

    var checkNotification = await collection.UserNotificationModel.query({where : {user_id : postUser.attributes.user_id , post_id : req.body.post_id, 
                            action_by_id : userId ,type : constants.NOTIFICATION_POST_LIKE}}).fetch();
    if(checkNotification!=null){
       var deletePrevious = await collection.UserNotificationModel.query({where : {id : checkNotification.attributes.id}}).destroy();
    }
    if(postUser.attributes.user_id != userId){
      var newNotification = await collection.UserNotificationModel.forge({user_id : postUser.attributes.user_id , post_id : req.body.post_id, 
                            action_by_id : userId ,type : constants.NOTIFICATION_POST_LIKE}).save();
    }


    var post = await postMySql.getPost(req.body.post_id);
    var postObj = await postMySql.getPostsObject(post,req.body.timezone);
    var user = await userMySql.getUserInfo(userId);
   
    if(like === 1 && (userId != postUser.attributes.user_id)){
      var pushData = {};
      pushData.push_type = constants.PUSH_TYPE_POST;
      pushData.post = postObj;
      pushData.conversation = {};
      pushData.user = {};
      pushData.message_to_display = user.attributes.username + constants.PUSH_MESSAGE_POST_LIKE;
      var notifyUser = await userMySql.notifyReceiver(postUser.attributes.user_id, pushData, user.attributes.username);
    }

    return postObj;
    } catch (e) {
      console.log(e);
    }
  }
};

var getPostLikes = async(req, res) => {
  req.assert('post_id','Post id is required').notEmpty();;
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    var postLikes = await collection.PostLikes.query((qb) => {
                      qb.where('post_likes.post_id',req.query.post_id);
                      qb.orderBy('id','ASC');
                    }).fetch();
    var jsonOutput = await getLikesOutput(postLikes);
    return jsonOutput;
  }
};

var getLikesOutput = async(postLikes) => {
  var likes = [];
    for(var i = 0 ; i<postLikes.length ; i++){
     var user = await userMySql.getUserInfo(postLikes.models[i].attributes.user_id);
     var userLikes = await userMySql.getUserProfile(user);
     // var image = await userMySql.getImageUrl(postLikes.models[i].attributes.image);
     // userLikes.full_name = postLikes.models[i].attributes.full_name;
     // userLikes.username = postLikes.models[i].attributes.username;
     // userLikes.image = image;
     likes.push(userLikes);
    }
  return likes;
};

var getPostComments = async(req, res) => {
  req.assert('post_id','Post id is required').notEmpty();;
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    var comments = await postMySql.getPostComments(req.query.post_id);
    return comments;
  }
};

var getPost = async(req, res) => {
  req.assert('post_id','Post id is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
  var jsonOutput = {};
  var post = await postMySql.getPost(req.query.post_id);
  jsonOutput.post = await postMySql.getPostsObject(post,req.query.timezone);
  jsonOutput.comments = await postMySql.getPostComments(req.query.post_id,req.query.timezone);
  return jsonOutput;
  }
};

var sharePost = async(req, res) => {
  req.checkBody('post_id','Post id is required').notEmpty();
  req.checkBody('user_id','User id is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    try{
    var userId = await getUserId(req.body.session_id);
    var mood = await moodMySql.getCurrentMood(userId);
    var moodId = mood.attributes.mood_id;

    var conversation = await checkConversation(userId, req.body.user_id);
    if(!conversation){
        //initialize new conversation
      var conversation = await collection.UserConversationModel.forge({user1_id : userId, user2_id : req.body.user_id}).save();
    }

    var createdAt = await timeFunction.setDateTime(req.body.timezone);
    var newMessage = await collection.UserMessagesModel.forge({conversation_id : conversation.attributes.id ,sender_id : userId, mood_id : moodId, post_id : req.body.post_id ,
                           type: constants.MESSAGE_TYPE_POST,created_at :createdAt,timezone : req.body.timezone,message : constants.MESSAGE_POST_SHARED}).save();

    var share = await collection.UserPostShareModel.forge({post_id : req.body.post_id , user_id : userId, shared_user_id : req.body.user_id}).save();

    var receiverId = await chatMySql.getReceiverId(conversation.attributes.id, userId);

    var receiverInfo = await chatMySql.getReceiverInfo(receiverId,conversation.attributes.id);
    var receiverTimezone = receiverInfo.receiver_timezone ? receiverInfo.receiver_timezone : req.body.timezone;

    var conversationObj = await chatMySql.getConversation(conversation.attributes.id, receiverId, req.body.timezone);
    var conversationObj = await chatMySql.conversationListing(conversationObj,receiverId,req.body.timezone);

    var user = await userMySql.getUserInfo(userId);

    var post = await postMySql.getPost(req.body.post_id);
    var jsonOutput = await postMySql.getPostsObject(post,req.body.timezone);

    //check if receiver has muted the conversation
    var isMuted = await checkIfMuted(conversation.attributes.id, receiverId);
    if(!isMuted){  
      //send push to receiver
      var data = {};
      data.push_type = constants.PUSH_TYPE_CHAT_MESSAGE;
      data.conversation = conversationObj;
      data.post = {};
      data.user = {};
      data.message_to_display = user.attributes.username + constants.PUSH_MESSAGE_SHARE_POST;
      console.log(data);
      var sendPush = await userMySql.notifyReceiver(receiverId,data,user.attributes.username);
    }

    var socket = receiverInfo.socket_id;

    if(socket.length >= 1){
      var updateReadCount = await chatMySql.updateReadStatus(conversation.attributes.id,userId);
    }

    for(var i = 0 ; i < socket.length ; i++){
      req.app.io.to(socket[i]).emit('receiveMessage', message);
    }

    return jsonOutput;
  } catch (e) {
    console.log(e);
  }

    //
    // var newGroup = await groupMySql.createNewGroup(userId, req.body.group_name , req.body.group_description , logo);
    // var newConversation = await collection.UserConversationModel.forge({group_id : newGroup.attributes.id}).save();
    // var newMessage = await collection.UserMessagesModel.forge({conversation_id : newConversation.attributes.id,sender_id : userId,message :})
  }
};

var checkConversation = async(user1_id, user2_id) => {
  var conversation = await collection.UserConversationModel.query(qb => {
                           qb.where(qb => {
                             qb.where('user1_id',user1_id);
                             qb.where('user2_id',user2_id);
                           });
                           qb.orWhere(qb => {
                             qb.where('user1_id',user2_id);
                             qb.where('user2_id',user1_id);
                           });
                     }).fetch();
  if(conversation!=null){
    return conversation;
  } else {
    return false;
  }
}

var hidePost = async(req, res) => {
  req.checkBody('post_id','Post id is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    var userId = await getUserId(req.body.session_id);
    var userHidePost = await collection.UserHidePostsModel.forge({post_id : req.body.post_id , user_id : userId}).save();
    var jsonOutput = {};
    jsonOutput.message = 'Post has been hidden';
    return jsonOutput;
  }
};

var reportPost = async(req, res) => {
  req.checkBody('post_id','Post id is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    var userId = await getUserId(req.body.session_id);
    var userHidePost = await collection.UserReportPostModel.forge({post_id : req.body.post_id , user_id : userId}).save();
    var jsonOutput = {};
    jsonOutput.message = 'Post has been reported';
    return jsonOutput;
  }
};

var deletePost = async (req, res) => {
  req.checkBody('post_id','Post id is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    var userId = await getUserId(req.body.session_id);
    var check = await collection.UserPostsModel.query({where : {id : req.body.post_id}}).fetch();
    if(check!=null){
      if(check.attributes.user_id != userId){
        throw 'You cannot delete this post';
      }
    } else {
      throw 'Invalid post id';
    }
    var userHidePost = await collection.UserPostsModel.query({where : {id : req.body.post_id}}).save({is_deleted : constants.IS_POST_DELETED},{patch : true});
    var jsonOutput = {};
    jsonOutput.message = 'Post has been deleted';
    return jsonOutput;
  }  
};

var addView = async(req, res) => {
  req.checkBody('post_id','Post id is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    var userId = await getUserId(req.body.session_id);
    var checkView = await collection.PostViewsModel.query({where : {user_id : userId , post_id : req.body.post_id}}).fetch();
    if(checkView==null){
      var userAddView = await collection.PostViewsModel.forge({post_id : req.body.post_id , user_id : userId}).save();
    }

    var post = await postMySql.getPost(req.body.post_id);
    var jsonOutput = await postMySql.getPostsObject(post,req.body.timezone);
    return jsonOutput;
  } 
};

var getUserId = async(sessionId) => {
  var appLogin = await collection.AppLoginModel.query({where : {session_id : sessionId}}).fetch();
  return appLogin.attributes.user_id;
};

var checkIfMuted = async(conversationId, userId) => {
  var isMute = await collection.UserMutedConversationsModel.query({where : {conversation_id : conversationId, user_id : userId}}).fetch();
  if(isMute!=null){
    return true;
  } else {
    return false;
  }
};


module.exports = {
  addPost,
  likePost,
  commentOnPost,
  getPostLikes,
  getPostComments,
  getPost,
  sharePost,
  hidePost,
  reportPost,
  addView,
  deletePost
}
