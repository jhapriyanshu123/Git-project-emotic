const moment = require('moment');

const collection = require('./../../Database/Collections');
const constants = require('./../../Library/Constants');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const awsWorker = require('../AwsController');

var getQuotes = async(req, res) => {

  var quotes = await collection.UserPosts.query(qb => {
                  qb.where('admin_post_type',constants.ADMIN_POST_TYPE_QUOTE);
                  qb.where('is_by_admin',constants.POST_BY_ADMIN);
                  qb.orderBy('id','DESC');
                 }).fetch({columns : ['user_posts.mood_id', 'user_posts.id', 'user_posts.media','user_posts.title','user_posts.description']});	
  var moods = await getMoods();

  res.render('Admin/pages/quotes',{quotes : quotes, moods : moods , fetchMood : fetchMood, url : req.url});
};

var showAddQuotes = async(req, res) => {
  var moods = await getMoods();
  res.render('Admin/pages/add_quotes',{moods : moods, url : req.url});
};

var addQuotes = async(req, res) => {
  try{
  var moods = req.body.mood_id;
  if(Array.isArray(moods)){
    var moodsStr = moods.join(',');
    var moodsStr = '[' + moodsStr + ']';
  } else {
    var moodsStr = '[' + moods + ']';
    var moods = JSON.parse(moodsStr);
  }

  var timestamp = moment().unix();
  var image = timestamp + req.file.originalname;
  var folder = constants.S3_POST_IMAGES;
  var uploadImage = await awsWorker.doUpload(req.file, image, folder);

  var newQuote = await collection.UserPostsModel.forge({mood_id : moodsStr , media : image ,timezone : req.body.timezone, is_by_admin : constants.POST_BY_ADMIN,
                       admin_post_type : constants.ADMIN_POST_TYPE_QUOTE, type : constants.POST_IMAGE,title : req.body.title , description : req.body.description}).save();
  
  for(var i = 0 ; i<moods.length; i++){
      var addPostMood = await collection.PostMoodModel.forge({post_id : newQuote.attributes.id , mood_id : moods[i]}).save();
  }

  res.redirect('/quotes');
} catch (e) {
  console.log(e);
} 
};

var showEditQuote = async(req, res) => {
  var moods = await collection.Moods.query(qb => {
                qb.orderBy('id','ASC');
              }).fetch();
  var quote = await collection.UserPostsModel.query({where : {id : req.query.quote_id}}).fetch();
  res.render('Admin/pages/edit_quotes',{quote : quote , moods : moods, quote_id : req.query.quote_id , url : req.url});
};

var updateQuote = async(req, res) => {
  var moods = req.body.mood_id;
    if(Array.isArray(moods)){
    var moodsStr = moods.join(',');
    var moodsStr = '[' + moodsStr + ']';
  } else {
    var moodsStr = '[' + moods + ']';
    var moods = JSON.parse(moodsStr);
  }

  if(req.file){
    var timestamp = moment().unix();
    var image = timestamp + req.file.originalname;
    var folder = constants.S3_POST_IMAGES;
    var uploadImage = await awsWorker.doUpload(req.file, image, folder);  	
  } else {
    var image = req.body.old_quote;
  }

    var modify = await collection.UserPostsModel.query(qb => {
                   qb.where('id',req.body.quote_id);
                 }).save({media : image, mood_id : moodsStr, title : req.body.title , description : req.body.description} , {patch : true});
    
  var check =   await collection.PostMoodModel.query({where : {post_id : req.body.quote_id}}).fetch();
  if(check!=null){
   await collection.PostMoodModel.query({where : {post_id : req.body.quote_id}}).destroy();
  }
  
  for(var i = 0 ; i<moods.length; i++){
      var addPostMood = await collection.PostMoodModel.forge({post_id : req.body.quote_id , mood_id : moods[i]}).save();
  }

  res.redirect('/quotes');
};

var deleteQuote = async(req, res) => {
  var destroy = await collection.UserPostsModel.query(qb => {
                  qb.where('id',req.query.quote_id);
                }).destroy();
  await collection.PostMoodModel.query(qb => {
                  qb.where('post_id',req.query.quote_id);
                }).destroy();
  res.redirect('/quotes');
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
	getQuotes,
	showAddQuotes,
	addQuotes,
	showEditQuote,
	updateQuote,
	deleteQuote,
  fetchMood
}