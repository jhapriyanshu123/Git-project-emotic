const moment = require('moment');

const collection = require('./../../Database/Collections');
const constants = require('./../../Library/Constants');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const awsWorker = require('../AwsController');

var getVideos = async(req, res) => {
    var videos = await collection.UserPosts.query(qb => {
                  qb.where('admin_post_type',constants.ADMIN_POST_TYPE_VIDEO);
                  qb.where('is_by_admin',constants.POST_BY_ADMIN);
                  qb.orderBy('id','DESC');
                 }).fetch({columns : ['user_posts.mood_id', 'user_posts.id', 'user_posts.media','user_posts.video_thumb', 'user_posts.title','user_posts.description']});	
  var moods = await getMoods();
  res.render('Admin/pages/videos',{videos : videos, moods : moods, fetchMood : fetchMood, url : req.url});
};

var showAddVideos = async(req, res) => {
  var moods = await getMoods();
  res.render('Admin/pages/add_videos',{moods : moods, url : req.url});
};

var addVideos = async(req, res) => {
  var moods = req.body.mood_id;
  if(Array.isArray(moods)){
    var moodsStr = moods.join(',');
    var moodsStr = '[' + moodsStr + ']';
  } else {
    var moodsStr = '[' + moods + ']';
    var moods = JSON.parse(moodsStr);
  }

  try{
  var imageObj = await getImageObject(req.files.image);
  var timestamp = moment().unix();
  var image = timestamp + imageObj.originalname;
  var folder = constants.S3_POST_VIDEOS;
  var uploadImage = await awsWorker.doUpload(imageObj, image, folder);

  var imageObj = await getImageObject(req.files.thumb);
  var thumb = timestamp + imageObj.originalname;
  var folder = constants.S3_POST_VIDEOS_THUMB;
  var uploadImage = await awsWorker.doUpload(imageObj, thumb, folder);

  var newVideo = await collection.UserPostsModel.forge({mood_id : moodsStr , media : image , timezone : req.body.timezone, video_thumb : thumb, 
                       is_by_admin : constants.POST_BY_ADMIN, admin_post_type : constants.ADMIN_POST_TYPE_VIDEO, type : constants.POST_VIDEO,
                       title : req.body.title, description : req.body.description}).save();
  for(var i = 0 ; i<moods.length; i++){
      var addPostMood = await collection.PostMoodModel.forge({post_id : newVideo.attributes.id , mood_id : moods[i]}).save();
  }

  res.redirect('/videos');
} catch (e){
  console.log(e);
} 
};

var showEditVideo = async(req, res) => {
  var moods = await getMoods();
  var video = await collection.UserPostsModel.query({where : {id : req.query.video_id}}).fetch();
  res.render('Admin/pages/edit_videos',{video : video,moods : moods,video_id : req.query.video_id, url : req.url});
};

var updateVideo = async(req, res) => {
  var moods = req.body.mood_id;
    if(Array.isArray(moods)){
    var moodsStr = moods.join(',');
    var moodsStr = '[' + moodsStr + ']';
  } else {
    var moodsStr = '[' + moods + ']';
    var moods = JSON.parse(moodsStr);
  }

  try{
  if(req.files.image){
    var imageObj = await getImageObject(req.files.image);
    var timestamp = moment().unix();
    var image = timestamp + imageObj.originalname;
    var folder = constants.S3_POST_VIDEOS;
    var uploadImage = await awsWorker.doUpload(imageObj, image, folder);  	
  } else {
    var image = req.body.old_video;
  }
  
  if(req.files.thumb){   
    var imageObj = await getImageObject(req.files.thumb);
    var thumb = timestamp + imageObj.originalname;
    var folder = constants.S3_POST_VIDEOS_THUMB;
    var uploadImage = await awsWorker.doUpload(imageObj, thumb, folder);
  } else {
    var thumb = req.body.old_video_thumb;
  }

    var modify = await collection.UserPostsModel.query(qb => {
                   qb.where('id',req.body.video_id);
                 }).save({media : image , mood_id : moodsStr , video_thumb : thumb , title : req.body.title , description : req.body.description} , {patch : true});

  var check = await collection.PostMoodModel.query({where : {post_id : req.body.video_id}}).fetch();
  if(check!=null){
    await collection.PostMoodModel.query({where : {post_id : req.body.video_id}}).destroy();
  } 
  for(var i = 0 ; i<moods.length; i++){
      var addPostMood = await collection.PostMoodModel.forge({post_id : req.body.video_id , mood_id : moods[i]}).save();
  }

    res.redirect('/videos');
  } catch (e) {
    console.log(e);
  }
  };

var deleteVideo = async(req, res) => {
  var destroy = await collection.UserPostsModel.query(qb => {
                  qb.where('id',req.query.video_id);
                }).destroy();
  res.redirect('/videos');
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

var getMoods = async() => {
  var moods = await collection.Moods.query(qb => {
                qb.orderBy('id','ASC');
              }).fetch();
  return moods;
}

var fetchMood = (moodId, moods) => {
  try{
  var postMoods = JSON.parse(moodId);

  var moodStr = '';
  for(var i = 0 ; i < moods.length; i++){
      if(postMoods.includes(moods.models[i].attributes.id)){
        moodStr += moods.models[i].attributes.name + ',';
      }
  }
  return moodStr;
} catch (e) {
  console.log(e);
}
};


module.exports = {
	getVideos,
	showAddVideos,
	addVideos,
	showEditVideo,
	updateVideo,
	deleteVideo,
  fetchMood
}