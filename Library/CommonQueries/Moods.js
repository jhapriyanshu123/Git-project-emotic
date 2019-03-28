const collection = require('./../../Database/Collections');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');
const timeFunction = require('./../../Library/TimeFunctions');

var getMoodInfo = async(moodId) => {
  var moodDetail = await collection.MoodsModel.query({where : {id : moodId}}).fetch();
  return moodDetail;
}

var getCurrentMood = async(userId) => {
  var mood = await collection.UserMoodModel.query({where : {user_id  : userId}}).fetch();
  return mood;
}

module.exports = {
	getMoodInfo,
	getCurrentMood
}