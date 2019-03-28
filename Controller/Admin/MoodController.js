const moment = require('moment');

const collection = require('./../../Database/Collections');
const constants = require('./../../Library/Constants');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const awsWorker = require('../AwsController');

var getMoods = async(req, res) => {
  if(req.query.mood_search){
  	var search = req.query.mood_search;
    search = search.replace(/^\s+/g, '');
  	var searchParam = '%'+search+'%';
  	var moods = await collection.Moods.query(qb => {
                 qb.where('name','like',searchParam);
                 qb.orderBy('id','ASC');
            	}).fetch();
  } else {
  	var search = '';
  	var moods = await collection.Moods.query(qb => {
                 qb.orderBy('id','ASC');
            	}).fetch();  	
  }
  res.render('Admin/pages/moods',{moods : moods , mood_search : search, url : req.url});
};

var showEditMood = async(req, res) => {
  var mood = await collection.MoodsModel.query({where : {id : req.query.mood_id}}).fetch();
  res.render('Admin/pages/edit_mood',{mood : mood,mood_id : req.query.mood_id, url : req.url});
};

var updateMood = async(req, res) => {
   if(req.file){
     var timestamp = moment().unix();
     var image = timestamp + req.file.originalname;
     var uploadImage = await awsWorker.doUpload(req.file, image, constants.S3_MOODS);
     var modify = await collection.MoodsModel.query({where : {id : req.body.mood_id}}).save({name : req.body.name , emoji : image, color : req.body.color}, {patch : true});
   } else {
   	 var modify = await collection.MoodsModel.query({where : {id : req.body.mood_id}}).save({name : req.body.name , color : req.body.color}, {patch : true});
   } 
   res.redirect('/moods');
}

var showAddMood = async(req, res) => {
  res.render('Admin/pages/add_mood', {url : req.url});
};

var addMood = async(req, res) => {
   var timestamp = moment().unix();
   var image = timestamp + req.file.originalname;
   var uploadImage = await awsWorker.doUpload(req.file, image, constants.S3_MOODS);
   var newMood = await collection.MoodsModel.forge({name : req.body.name , emoji : image, color : req.body.color}).save();
   res.redirect('/moods');
};

var deleteMood = async(req, res) => {
  var destroyMood = await collection.MoodsModel.query({where : {id : req.query.mood_id}}).destroy();
  res.redirect('/moods');
}

module.exports = {
	getMoods,
	updateMood,
	addMood,
	deleteMood,
	showEditMood,
	showAddMood
}