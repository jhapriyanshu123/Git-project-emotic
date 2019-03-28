const moment = require('moment');

const push = require('./../Library/Helpers/FCM');
const collection = require('./../Database/Collections');
const timeFunction = require('./../Library/TimeFunctions');
const userMySql = require('./../Library/CommonQueries/Users');
const postMySql = require('./../Library/CommonQueries/Posts');
const chatMySql = require('./../Library/CommonQueries/Chat');
const moodMySql = require('./../Library/CommonQueries/Moods');
const constants = require('./../Library/Constants');

var sendMessage = async(data,socketId) => {
  // var data = JSON.parse(data);
  var jsonOutput = {};
  var sockets = [];

  var userId = await getUserId(data.session_id);
  var user = await getUser(userId);

  var conversationId = data.conversation_id;
  var timezone = data.timezone;
  var createdAt = await timeFunction.setDateTime(timezone);

  var mood = await moodMySql.getCurrentMood(userId);
  var message = await chatMySql.getMessage(data.message_type, data.message);

  var newMessage = await collection.UserMessagesModel.forge({conversation_id : conversationId ,sender_id : userId, message : message ,
                   type: data.message_type,created_at :createdAt,timezone : timezone, mood_id : mood.attributes.mood_id}).save();

  var checkGroup = await collection.UserConversationModel.query({where : {id : conversationId}}).fetch();
  if(checkGroup.attributes.group_id == null){
    var isGroup = 0;
    var receiverId = await chatMySql.getReceiverId(conversationId, userId);
  } else {
    var isGroup = 1;
    var receiverId = [];
    var receivers = await collection.UserGroupMembers.query({where : {group_id : checkGroup.attributes.group_id}}).fetch();
    for(var r=0;r<receivers.length;r++){
      if(userId == receivers.models[r].attributes.user_id){
        continue;
      }
      receiverId.push(receivers.models[r].attributes.user_id);
    }
  }

  // var unreadConversations = await collection.UserMessages.query(qb => {
  //                             qb.leftJoin('user_conversation','user_conversation.id','user_messages.conversation_id');
  //                             qb.where(qb => {
  //                               qb.where('user_conversation.user1_id',receiverId);
  //                               qb.orWhere('user_conversation.user2_id',receiverId);
  //                             });
  //                             qb.where('user_messages.sender_id','!=',receiverId);
  //                             qb.where('user_messages.is_read',0);
  //                             qb.groupBy('user_conversation.id');
  //                           }).fetch();
  // var unreadConversationsCount = unreadConversations.length;

  //find Receiver Socket Id and timezone
  if(isGroup == 1){
    for(var j = 0;j<receiverId.length;j++){
      var receiverInfo = await chatMySql.getReceiverInfo(receiverId[j], conversationId);
      var receiverTimezone = receiverInfo.receiver_timezone ? receiverInfo.receiver_timezone : timezone;

      var messages = await collection.UserMessages.query({where :{id : newMessage.attributes.id}}).fetch();
      var message = await chatMySql.messageListing(messages,userId,conversationId,receiverTimezone);

      var user = await userMySql.getUserInfo(userId);
      var conversation = await chatMySql.getConversation(conversationId, receiverId[j], receiverTimezone);
      var conversation = await chatMySql.conversationListing(conversation,receiverId[j],receiverTimezone);

      //check if receiver has muted the conversation
      var isMuted = await checkMutedConversation(conversationId, receiverId[j]);
      if(isMuted==null){  
        //send push to receiver
        var data = {};
        data.push_type = constants.PUSH_TYPE_CHAT_MESSAGE;
        data.conversation = conversation;
        data.post = {};
        data.user = {};
        data.message_to_display = user.attributes.username + constants.PUSH_MESSAGE_SEND_MESSAGE;
        console.log(data);
        var sendPush = await userMySql.notifyReceiver(receiverId[j],data,user.attributes.username); 
      }

        var receiverSocketArr = receiverInfo.socket_id;
        for(var x=0;x<receiverSocketArr.length;x++){  
          console.log(receiverSocketArr[x]);
          sockets.push(receiverSocketArr[x]);
        }
    }
  } else{
      var receiverInfo = await chatMySql.getReceiverInfo(receiverId, conversationId);
      var sockets = receiverInfo.socket_id;
      var receiverTimezone = receiverInfo.receiver_timezone ? receiverInfo.receiver_timezone : timezone;

      var messages = await collection.UserMessages.query({where :{id : newMessage.attributes.id}}).fetch();
      var message = await chatMySql.messageListing(messages,userId,conversationId,receiverTimezone);

      var user = await userMySql.getUserInfo(userId);
      var conversation = await chatMySql.getConversation(conversationId, receiverId, receiverTimezone);
      var conversation = await chatMySql.conversationListing(conversation,receiverId,receiverTimezone);

      //check if receiver has muted the conversation
      var isMuted = await checkMutedConversation(conversationId, receiverId);
      if(isMuted==null){  
        //send push to receiver
        var data = {};
        data.push_type = constants.PUSH_TYPE_CHAT_MESSAGE;
        data.conversation = conversation;
        data.post = {};
        data.user = {};
        data.message_to_display = user.attributes.username + constants.PUSH_MESSAGE_SEND_MESSAGE;
        var sendPush = await userMySql.notifyReceiver(receiverId,data,user.attributes.username);   
      }
     } 

  jsonOutput.message = message;
  jsonOutput.socketId = sockets;

  return jsonOutput;
};

var checkMutedConversation = async(conversationId, receiverId) => {
  var isMuted = await collection.UserMutedConversationsModel.query({where : {conversation_id : conversationId, user_id : receiverId}}).fetch();
  return isMuted;
};

var checkMutedGroup = async(conversationId, receiverId) => {
  var group = await collection.UserConversationModel.query({where : {id : conversationId}}).fetch();
  var isMuted = await collection.UserGroupMembersModel.query({where : {group_id : group.attributes.group_id, user_id : receiverId}}).fetch();
  if(isMuted.attributes.notification_enabled == 1){
    return true;
  } else {
    return false;
  }
};

var updateUserStatus = async(data,status,socketId) => {
  try{
  var userId = await getUserId(data.session_id);
  var conversationId = data.conversation_id;
  var updateStatus = await collection.UsersModel.query({where : {id : userId}}).save({is_online : status}, {patch : true});
 
  if(status == 1){
    var newEntry = await collection.UserSocketModel.forge({conversation_id : conversationId ,user_id : userId, timezone : data.timezone , socket_id : socketId}).save();
  } else if (status == 0){
    var check = await collection.UserSocketModel.query({where : {user_id : userId, conversation_id : conversationId}}).fetch();
    if(check!=null){
      var removeSocket = await collection.UserSocketModel.query({where : {user_id : userId, conversation_id : conversationId}}).destroy();
    }
  }

} catch (e) { 
console.log(e);
}
  return;
};

var updateReadStatus = async(data) => {
  var userId = await getUserId(data.session_id);
  var conversationId = data.conversation_id;

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

var getReceiverSocket = async(sessionId,socketId,receiverId) => {
  var receiverSocketId = '';
  var updateSocket = await collection.AppLoginModel.query({where : {session_id : sessionId}}).save({socket_id : socketId} , {patch : true} , {require : false});
  var getReceiverSocketId = await collection.AppLoginModel.query(qb => {
                            qb.where('user_id',receiverId);
                            }).fetch();
  if(getReceiverSocketId != null){
     receiverSocketId = getReceiverSocketId.attributes.socket_id;
  };
  return receiverSocketId;
};

var updateSocketId = async(data) => {
var data = JSON.parse(data);
var updateSocket = await collection.AppLoginModel.query({where : {session_id : data.session_id}}).save({socket_id : ''} , {patch : true} , {require : false});
return;
};

var getConverastion = async(messages,userId,conversationId,timezone) => {
var userInfo = await getUser(userId);
var messagesOuput = {};
for(var i = 0 ; i < messages.length ; i++){
  var sentByReceiver = 1;

  if(userId == messages.models[i].attributes.sender_id){
    sentByReceiver = 0;
  }

  var createdAt = messages.models[i].attributes.created_at;
  var date = await timeFunction.getDate(createdAt, timezone,"D MMM, YYYY");
  var time = await timeFunction.getTime(createdAt, timezone,"h:mm a");

  var userImage = await userMySql.getImageUrl(userInfo.attributes.image);
  messagesOuput.id = conversationId;
  messagesOuput.message = messages.models[i].attributes.message;
  messagesOuput.time_since = time;
  messagesOuput.user_id = userId
  messagesOuput.user_name = userInfo.attributes.full_name;
  messagesOuput.user_image = userImage;
  messagesOuput.unread_messages_count = 0;
}
return messagesOuput;
};

var notifyReceiver = async(receiver_id,data,username) => {
var tokens = await collection.AppLogin.query(qb => {
              qb.where('user_id',receiver_id);
              qb.whereNotNull('device_token');
              qb.orderBy('id','DESC');
             }).fetch();
if(tokens!=null){
  for(var i = 0; i < tokens.length ; i++){
    if(tokens.models[i].attributes.device_token){
      var sendPush = await push.sendPush(tokens.models[i].attributes.device_token,data,tokens.models[i].attributes.device_type,username);
    }
  }
}
return;
};


var getUserId = async (sessionId) => {
var userId = await collection.AppLoginModel.query({where : {session_id : sessionId}}).fetch();
return userId.attributes.user_id;
};

var getUser = async(userId) => {
var userInfo = await collection.UsersModel.query(qb => {
                       qb.where('id',userId);
                }).fetch();
return userInfo;
};

module.exports = {
  sendMessage,
  getReceiverSocket,
  updateSocketId,
  updateUserStatus,
  updateReadStatus
}
