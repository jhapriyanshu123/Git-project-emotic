const axios = require('axios');

const CONFIG = require('./../../Config/config');
const collection = require('./../../Database/Collections');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');


var getGifs = async(req, res) => {
  //var currentMood = await getUserMood(userId);
  var keyword = req.query.keyword ? req.query.keyword : '';
  var jsonOutput = ['https://media.giphy.com/media/l3q2yYNt8DXoyKRdm/giphy.gif','http://www.reactiongifs.com/r/hsk.gif',
                     'https://media.giphy.com/media/3oKIPvQWkVBKRkPYJy/giphy.gif'];
  // var gifUrl = 'https://api.giphy.com/v1/gifs/search?api_key=' + CONFIG.giphy_api_key + '&q=' + keyword + '&limit=25&offset=0&rating=G&lang=en';
  // var gifs = await axios.get(gifUrl);
  // console.log(gifs.data.data);
  // if(gifs.meta.status == 200){
  // 	console.log('here');
  // 	var jsonOutput = getGifsOutput(gifs);
  // }
  return jsonOutput;
};

var getGifsOutput = async(gifs) => {
console.log(gifs.data.data);
};

var getYoutubeVideos = async(req, res) => {
  try{
  // var userId = await getUserId(req.query.session_id);
  // var currentMood = await getUserMood(userId);
  var keyword = req.query.keyword ? req.query.keyword : '';
  var youtubeUrl = 'https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=' + keyword + '&type=video&key=' + CONFIG.youtube_api_key;
  var videos = await axios.get(youtubeUrl);
  if(videos.status == 200){
    var youtubeVideos = await getVideos(videos.data);
    return youtubeVideos;
  }
} catch (e) {
  console.log(e);
}
};

var getVideos = async(videos) => {
  var jsonOutput = [];
  var items = videos.items;
  for(var i = 0 ; i<items.length; i++){
    var videoObj = {};
    var thumbnails = items[i].snippet.thumbnails;
 
    videoObj.id = items[i].id.videoId; 
    videoObj.title = items[i].snippet.title;
    videoObj.description = items[i].snippet.description;
    videoObj.thumb = thumbnails.high.url;
    jsonOutput.push(videoObj);
  }
  return jsonOutput;
};

var getUserMood = async(userId) => {
  var currentMood = await collection.UserMoodModel.query({where : {user_id : userId}}).fetch();
  return currentMood.attributes.name;
};

var getUserId = async(sessionId) => {
  var appLogin = await collection.AppLoginModel.query({where : {session_id : sessionId}}).fetch();
  return appLogin.attributes.user_id;
}

module.exports = {
	getGifs,
  getYoutubeVideos
}