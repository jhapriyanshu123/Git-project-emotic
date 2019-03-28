const collection = require('./../../Database/Collections');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');
const timeFunction = require('./../../Library/TimeFunctions');
const userMysql = require('./Users');
const postMySql = require('./Posts');
const moodMySql = require('./Moods');


var messageListing = async(messages,userId,conversationId,timezone) => {
var userInfo = await getUserInfo(userId);
var messagesOuput = {};

for(var i = 0 ; i < messages.length ; i++){
  var post = {};
  if(messages.models[i].attributes.post_id!=null){
    var post = await postMySql.getPost(messages.models[i].attributes.post_id);
    var post = await postMySql.getPostsObject(post,timezone); 
  }
  var sentByReceiver = 1;

  if(userId == messages.models[i].attributes.sender_id){
    sentByReceiver = 0;
  }

  // var mood = await moodMySql.getCurrentMood(userId);
  var moodInfo = await moodMySql.getMoodInfo(messages.models[i].attributes.mood_id);

  var createdAt = messages.models[i].attributes.created_at;
  var date = await timeFunction.getDate(createdAt, timezone,"D MMM, YYYY");
  var time = await timeFunction.getTime(createdAt, timezone,"h:mm a");

  var userImage = await userMysql.getImageUrl(userInfo.attributes.image);
  messagesOuput.id = messages.models[i].attributes.id;
  messagesOuput.conversation_id = conversationId;
  messagesOuput.message = messages.models[i].attributes.message;
  messagesOuput.date = date;
  messagesOuput.time = time;
  messagesOuput.type = messages.models[i].attributes.type;
  messagesOuput.sent_by_me = sentByReceiver;
  messagesOuput.user_id = userId
  messagesOuput.user_name = userInfo.attributes.full_name;
  messagesOuput.user_image = userImage;
  messagesOuput.post = post;
  messagesOuput.image = messages.models[i].attributes.image ?  constants.USER_IMAGE_PATH + messages.models[i].attributes.image : '';
  messagesOuput.mood_color = moodInfo.attributes.color;
}
return messagesOuput;
};

var getConversation = async(conversationId, userId, timezone) => {
var conversation = await collection.UserConversationModel.query(qb => {
                        qb.leftJoin('users as u1','u1.id','user_conversation.user1_id');
                        qb.leftJoin('users as u2','u2.id','user_conversation.user2_id');
                        qb.leftJoin('user_groups','user_groups.id','user_conversation.group_id');
                        qb.leftJoin('user_group_members','user_group_members.group_id','user_groups.id');
                        qb.leftJoin('user_messages','user_messages.conversation_id','user_conversation.id')
                        qb.where(qb => {
                          qb.where(qb => {
                            qb.where('user_conversation.user1_id',userId).orWhere('user_conversation.user2_id',userId);
                          });
                          qb.orWhere(qb => {
                            qb.whereIn('user_conversation.group_id',(qb) => {
                              qb.from('user_group_members');
                              qb.where('user_group_members.user_id',userId);
                              qb.select('user_group_members.group_id');
                            });
                          });
                        });
                        qb.where(qb => {
                              qb.where('user_messages.deleted_by_user1_id','!=',userId);
                              qb.where('user_messages.deleted_by_user2_id','!=',userId);
                        });
                        qb.where('user_messages.conversation_id',conversationId);
                        qb.whereRaw('user_messages.id IN (SELECT max(id) FROM user_messages as m1 group by m1.conversation_id)');
                        qb.groupBy('user_messages.conversation_id');
                        qb.orderBy('user_messages.id','DESC');
                      }).fetch({columns: ['user_messages.sender_id' , 'user_messages.post_id','user_messages.message' ,'user_messages.timezone', 'user_messages.created_at' ,'user_conversation.user1_id','user_messages.mood_id',
                                          'user_conversation.user2_id','user_messages.conversation_id','user_groups.name','user_groups.logo','user_groups.id','user_messages.is_read','user_conversation.group_id']}); 
return conversation;
};

var conversationListing = async(messages,userId,timezone) => {
  try{
// var jsonOutput = [];
// for(var i = 0 ; i < messages.length ; i++){
  var messagesOuput = {};
  var image = '';
  var isGroup = 0;
  var isMute = await checkIfMuted(messages.attributes.conversation_id, userId);

  var createdAt = messages.attributes.created_at;
  var timezone = timezone ? timezone : messages.attributes.timezone;
  var moodInfo = await moodMySql.getMoodInfo(messages.attributes.mood_id);

  if(userId == messages.attributes.user1_id){
     var userInfo = await getUserInfo(messages.attributes.user2_id);
     // var mood = await moodMySql.getCurrentMood(messages.attributes.user2_id);
     // var moodInfo = await moodMySql.getMoodInfo(mood.attributes.mood_id);
  }
  else if(userId == messages.attributes.user2_id){
     var userInfo = await getUserInfo(messages.attributes.user1_id);
     // var mood = await moodMySql.getCurrentMood(messages.attributes.user1_id);
     // var moodInfo = await moodMySql.getMoodInfo(mood.attributes.mood_id);
  } 
  else{
     isGroup = 1;
  }

  var time = await timeFunction.getDateTime(createdAt,timezone);
  var timeSince = await timeFunction.getTimeSince(createdAt,timezone);
  var unreadMessages = await getUnreadMessagesCount(messages.attributes.conversation_id);

  if(!isGroup){
    image = await userMysql.getImageUrl(userInfo.attributes.image);
  }

  if(isGroup==0){
    var userName = userInfo.attributes.username;
  } else {
    var userName = '';
  }


  messagesOuput.id = messages.attributes.conversation_id;
  messagesOuput.user_id = isGroup ? 0 : userInfo.attributes.id;
  //messagesOuput.user_id = userInfo.attributes.id;
  messagesOuput.user_image = image;
  messagesOuput.user_name =  userName;
  //messagesOuput.user_name =  userInfo.attributes.full_name;
  messagesOuput.group_id = messages.attributes.group_id ? messages.attributes.group_id : 0;
  messagesOuput.group_name = messages.attributes.name ? messages.attributes.name : '';
  messagesOuput.group_image = messages.attributes.logo ? constants.GROUP_IMAGE_PATH + messages.attributes.logo : '';
  messagesOuput.mood_image = moodInfo.attributes.emoji ? constants.EMOJI_IMAGE_PATH + moodInfo.attributes.emoji : '';
  messagesOuput.mood_color = moodInfo.attributes.color ? moodInfo.attributes.color : '';
  messagesOuput.message = messages.attributes.message;
  messagesOuput.time_since = timeSince;
  messagesOuput.unread_messages_count = unreadMessages;
  messagesOuput.is_online = isGroup ? 0 : userInfo.attributes.is_online;
  messagesOuput.is_muted = isMute ? 1 : 0;
  // jsonOutput.push(messagesOuput);
// }
} catch (e) {
  console.log(e);
}
return messagesOuput;
};

var checkIfMuted = async(conversationId, userId) => {
  var isMute = await collection.UserMutedConversationsModel.query({where : {conversation_id : conversationId, user_id : userId}}).fetch();
  if(isMute!=null){
    return true;
  } else {
    return false;
  }
};

var getUserInfo  = async(userId) => {
  var user = await collection.UsersModel.query({where : {id : userId}}).fetch();
  return user;
};

var getUnreadMessagesCount = async(conversationId) => {
  var messagesCount = await collection.UserMessages.query({where : {conversation_id : conversationId}}).count();
  return messagesCount;
};

var getReceiverInfo = async(userId, conversationId) => {
  try{ 
    var receiverInfo = {};
    var receiverSocket = await collection.UserSocket.query({where : {user_id : userId,conversation_id : conversationId}}).fetch();
    var socketId = [];
    var receiverTimezone = '';
    receiverSocket.forEach((data) => {
       receiverTimezone = data.attributes.timezone;
       socketId.push(data.attributes.socket_id);
    });
    receiverInfo.socket_id = socketId;
    receiverInfo.receiver_timezone = receiverTimezone;
  } catch (e) {
    console.log(e);
  }
  return receiverInfo;
};

var updateReadStatus = async(conversationId, userId) => { 
  var checkMessages = await collection.UserMessages.query(qb => {
                            qb.where('conversation_id',conversationId);
                            qb.where('sender_id',userId);  
                            qb.where('is_read',0);
                      }).fetch();

  for(var i = 0 ; i < checkMessages.length ; i++){
      var updateReadCount = await collection.UserMessagesModel.query(qb => {
                            qb.where('id',checkMessages.models[i].attributes.id);
                            }).save({is_read : 1} , {patch : true}  , {require : false});
  }
  return;
};

var getMessage = async(messageType, message) => {
   if(messageType == constants.MESSAGE_TYPE_MESSAGE){
      var message = message;
   } 
   else if(messageType == constants.MESSAGE_TYPE_IMAGE){
      var message = constants.MESSAGE_PICTURE_SHARED;
   } 
   else if(messageType == constants.MESSAGE_TYPE_POST){
      var message = constants.MESSAGE_POST_SHARED;
   }
   return message;       
};

var getReceiverId = async(conversationId, userId) => {
  var conversation = await collection.UserConversationModel.query({where : {id : conversationId}}).fetch();
  if(userId == conversation.attributes.user1_id){
    var receiverId = conversation.attributes.user2_id;
  }
  else {
    var receiverId = conversation.attributes.user1_id;
  }
  return receiverId;
};

var getUserId = async (sessionId) => {
var userId = await collection.AppLoginModel.query({where : {session_id : sessionId}}).fetch();
return userId.attributes.user_id;
};

var getUserInfo  = async(userId) => {
  var user = await collection.UsersModel.query({where : {id : userId}}).fetch();
  return user;
};

module.exports = {
 messageListing,
 getReceiverInfo,
 updateReadStatus,
 getMessage,
 getReceiverId,
 getConversation,
 conversationListing
}