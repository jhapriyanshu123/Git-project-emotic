const collection = require('./../../Database/Collections');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');
const userMySql = require('./../../Library/CommonQueries/Users');

var updateMood = async(req, res) => {
  req.checkBody('mood_id','Mood is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    var userId = await getUserId(req.body.session_id);
    if(await collection.UserMoodModel.query({where : {user_id : userId}}).fetch() == null){
      var newEntry = await collection.UserMoodModel.forge({mood_id : req.body.mood_id , user_id : userId}).save();
    }
    else{
      var update = await collection.UserMoodModel.query({where : {user_id : userId}}).save({mood_id : req.body.mood_id} , {patch : true});
    }
    var getUser = await userMySql.getUserInfo(userId);
    var jsonOutput = await userMySql.getUserProfile(getUser);
    return jsonOutput;
  }
};

var getMoods = async(req, res) => {
  try{
  var moods = await collection.Moods.query(qb => {
                qb.orderBy('id','ASC');
              }).fetch();
  var jsonOutput = [];
  moods.forEach((data) => {
    var moodsOutput = {};
    moodsOutput.id = data.attributes.id;
    moodsOutput.name = data.attributes.name;
    moodsOutput.icon = constants.EMOJI_IMAGE_PATH + data.attributes.emoji;
    moodsOutput.color = data.attributes.color;
    jsonOutput.push(moodsOutput);
  });
} catch (e) {
  console.log(e);
}
  return jsonOutput;
};

var getUserId = async(sessionId) => {
  var appLogin = await collection.AppLoginModel.query({where : {session_id : sessionId}}).fetch();
  return appLogin.attributes.user_id;
}

module.exports = {
  updateMood,
  getMoods
}
