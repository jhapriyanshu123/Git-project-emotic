const moment = require('moment');

const io = require('../../app').io;
const collection = require('./../../Database/Collections');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');
const timeFunction = require('./../../Library/TimeFunctions');
const userMySql = require('./../../Library/CommonQueries/Users');
const moodMySql = require('./../../Library/CommonQueries/Moods');
const postMySql = require('./../../Library/CommonQueries/Posts');
const chatMySql = require('./../../Library/CommonQueries/Chat');
const awsWorker = require('../AwsController');

var initializeConversation = async(req, res) => {
  req.checkBody('friend_id','Friend id is required').notEmpty();
  req.checkBody('type','Type is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    try{
    var userId = await getUserId(req.body.session_id);
    var jsonOutput = {};
    var messagesOuput = [];
    if(req.body.type == 1){
      var conversation = await collection.UserConversationModel.query(qb => {
                            qb.where(qb => {
                               qb.where('user1_id',userId);
                               qb.where('user2_id',req.body.friend_id);
                             });
                             qb.orWhere(qb => {
                               qb.where('user1_id',req.body.friend_id);
                               qb.where('user2_id',userId);
                             });
                         }).fetch();
    } else {
      var conversation = await collection.UserConversationModel.query(qb => {
                               qb.where('group_id',req.body.friend_id);
                         }).fetch();
    }

    if(conversation!=null){
      var messages = await collection.UserMessages.query(qb => {
                      qb.where('conversation_id',conversation.attributes.id);
                      qb.where(qb => {
                          qb.where('user_messages.deleted_by_user1_id','!=',userId);
                          qb.where('user_messages.deleted_by_user2_id','!=',userId);
                      });
                      qb.whereRaw('DATEDIFF(NOW(),user_messages.created_at) <= 1');
                      qb.orderBy('id','ASC');
                     }).fetch();
      if(messages!=null){
         messagesOuput = await conversationMessageListing(messages,userId,req.body.friend_id,conversation.attributes.id,req.body.timezone);
      }
    } else {
      var conversation = await collection.UserConversationModel.forge({user1_id : userId, user2_id : req.body.friend_id}).save();
    }
    

    var isMute = await checkIfMuted(conversation.attributes.id, userId);

    jsonOutput.is_muted = isMute ? 1 : 0;
    jsonOutput.conversation_id = conversation.attributes.id;
    jsonOutput.messages = messagesOuput;
    return jsonOutput;
  }
    catch (e) {
        console.log(e);
    }
    }
  };

var getConversationListing = async(req, res) => {
  var userId = await getUserId(req.query.session_id);

 try{
  var conversation = await collection.UserConversation.query(qb => {
                        qb.leftJoin('users as u1','u1.id','user_conversation.user1_id');
                        qb.leftJoin('user_groups','user_groups.id','user_conversation.group_id');
                        qb.leftJoin('users as u2','u2.id','user_conversation.user2_id');
                        qb.leftJoin('user_messages','user_messages.conversation_id','user_conversation.id');
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
                        qb.whereRaw('user_messages.id IN (SELECT max(id) FROM user_messages as m1 group by m1.conversation_id)');
                        qb.groupBy('user_conversation.id');
                        qb.orderBy('user_messages.id','DESC');
                      }).fetch({columns: ['user_messages.sender_id' , 'user_messages.post_id','user_messages.message' ,'user_messages.timezone', 'user_messages.created_at' ,'user_conversation.user1_id',
                                          'user_conversation.user2_id','user_messages.conversation_id','user_messages.is_read','user_groups.id as group_id','user_groups.name','user_groups.logo',
                                          'user_messages.for_group','user_messages.mood_id'
                                          ]}); 

               
   } catch (e) {
    console.log(e);
   }                             

  var jsonOutput = [];
  for(var i = 0 ; i < conversation.length ; i++){
    if(userId == conversation.models[i].attributes.user1_id){
      var isBlocked = await userMySql.checkBlocked(userId, conversation.models[i].attributes.user2_id);
      if(isBlocked){
        continue;
      }
    } else {
      var isBlocked = await userMySql.checkBlocked(userId, conversation.models[i].attributes.user1_id);
      if(isBlocked){
        continue;
      }
     
    }
    var messagesOuput = {};
    messagesOuput = await chatMySql.conversationListing(conversation.models[i],userId,req.query.timezone);
    jsonOutput.push(messagesOuput);
  }
  res.status(200).json(jsonOutput);
};


var getUnreadMessagesCount = async(conversationId) => {
  var messagesCount = await collection.UserMessages.query({where : {conversation_id : conversationId}}).count();
  return messagesCount;
};

var getConversationMessages = async(req, res) => {
  req.assert('conversation_id','Conversation id is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    try{
    var jsonOutput = [];
    var userId = await getUserId(req.query.session_id);
    var conversationId = req.query.conversation_id;

    var messages = await collection.UserMessages.query(qb => {
                    qb.where('conversation_id',conversationId);
                    qb.where(qb => {
                      qb.where('deleted_by_user1_id','!=',userId);
                      qb.where('deleted_by_user2_id','!=',userId);
                    });
                    qb.whereRaw('DATEDIFF(NOW(),user_messages.created_at) <= 1');
                    qb.orderBy('id','ASC');
                   }).fetch();

    var friendId = await collection.UserConversationModel.query({where : {id : req.query.conversation_id}}).fetch();

    if(userId == friendId.attributes.user1_id){
      friendId = friendId.attributes.user2_id;
    } else {
      friendId = friendId.attributes.user1_id;
    }

    jsonOutput = await conversationMessageListing(messages,userId,friendId,conversationId,req.query.timezone);
    return jsonOutput;
  } catch (e) {
      console.log(e);
    }
  }
};

var conversationMessageListing = async(messages,userId,friendId,conversationId,timezone) => {
  var jsonOutput = [];
  for(var i = 0 ; i < messages.length ; i++){
    if(messages.models[i].attributes.for_group == 1){
      continue;
    }
    var post = {};
    var messagesOuput = {};
    var sentByMe = 0;
    if(userId == messages.models[i].attributes.sender_id){
      sentByMe = 1;
    }

    if(messages.models[i].attributes.post_id!=null){
      var post = await postMySql.getPost(messages.models[i].attributes.post_id);
      var post = await postMySql.getPostsObject(post,timezone); 
    }

    var friendInfo = await getUserInfo(messages.models[i].attributes.sender_id);

    // var mood = await moodMySql.getCurrentMood(friendInfo.attributes.id);
    var moodInfo = await moodMySql.getMoodInfo(messages.models[i].attributes.mood_id);

    var image = await userMySql.getImageUrl(friendInfo.attributes.image);

    var timezone = timezone ? timezone : messages.models[i].attributes.timezone;
    var createdAt = messages.models[i].attributes.created_at;
    var date = await timeFunction.getDate(createdAt, timezone,"D MMM, YYYY");
    var time = await timeFunction.getTime(createdAt, timezone,"h:mm a");

    messagesOuput.id = messages.models[i].attributes.id;
    //messagesOuput.conversation_id = conversationId;
    messagesOuput.message = messages.models[i].attributes.message;
    messagesOuput.date = date;
    messagesOuput.time = time;
    messagesOuput.type = messages.models[i].attributes.type;
    messagesOuput.user_id = friendInfo.attributes.id;
    messagesOuput.user_name = friendInfo.attributes.full_name;
    messagesOuput.user_image = image;
    messagesOuput.sent_by_me = sentByMe;
    messagesOuput.post = post;
    messagesOuput.image = messages.models[i].attributes.image ?  constants.USER_IMAGE_PATH + messages.models[i].attributes.image : '';
    messagesOuput.mood_color = moodInfo.attributes.color;
    jsonOutput.push(messagesOuput);
  }
  return jsonOutput;
};

var muteConversation = async(req, res) => {
  req.checkBody('conversation_id','Conversation id is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    try{
    var userId = await getUserId(req.body.session_id);
    var jsonOutput = {};
   
    var isMute = await checkIfMuted(req.body.conversation_id, userId);
    if(isMute){
      var unmute = await collection.UserMutedConversationsModel.query({where : {conversation_id : req.body.conversation_id, user_id : userId}}).destroy();
      jsonOutput.message = 'Conversation has been unmuted';
    } else{
      var muteConvo = await collection.UserMutedConversationsModel.forge({conversation_id : req.body.conversation_id,user_id : userId}).save();
      jsonOutput.message = 'Conversation has been muted';
    }
    return jsonOutput;
  } catch (e) {
    console.log(e);
  }
}
};

var uploadChatImage = async(req, res) => {
  try{
  var jsonOutput = {};
  var userId = await getUserId(req.body.session_id);
  if(req.file){
    var timestamp = moment().unix();
    var image = timestamp + req.file.originalname;
    var uploadImage = await awsWorker.doUpload(req.file, image, constants.S3_USERS);
  }

    // var image = req.file ? req.file.originalname : '';
    var createdAt = await timeFunction.setDateTime(req.body.timezone);

    var message = await chatMySql.getMessage(req.body.message_type, req.body.message);

    var newMessage = await collection.UserMessagesModel.forge({conversation_id : req.body.conversation_id ,sender_id : userId, message : message ,
                   type: req.body.message_type,created_at :createdAt,timezone : req.body.timezone,image: image}).save();

    var receiverId = await chatMySql.getReceiverId(req.body.conversation_id, userId);

    var receiverInfo = await chatMySql.getReceiverInfo(receiverId, req.body.conversation_id);
    var receiverTimezone = receiverInfo.receiver_timezone ? receiverInfo.receiver_timezone : req.body.timezone;
    //var messages = await collection.UserMessages.query({where :{id : newMessage.attributes.id}}).fetch();

    //var message = await chatMySql.messageListing(messages,userId,req.body.conversation_id,receiverTimezone);
    var conversation = await chatMySql.getConversation(req.body.conversation_id, receiverId, req.body.timezone);
    var conversation = await chatMySql.conversationListing(conversation,receiverId,req.body.timezone);
    var user = await userMySql.getUserInfo(userId);

    //check if receiver has muted the conversation
    var isMuted = await checkIfMuted(req.body.conversation_id, receiverId);
    if(!isMuted){  
      //send push to receiver
      var data = {};
      data.push_type = constants.PUSH_TYPE_CHAT_MESSAGE;
      data.conversation = conversation;
      data.user = {};
      data.post = {};
      data.message_to_display = user.attributes.username + constants.PUSH_MESSAGE_SHARE_IMAGE;
      console.log(data);
      var sendPush = await userMySql.notifyReceiver(receiverId,data,user.attributes.username);
    }

    var socket = receiverInfo.socket_id;

    if(socket.length >= 1){
      var updateReadCount = await chatMySql.updateReadStatus(req.body.conversation_id, userId);
    }

    for(var i = 0 ; i < socket.length ; i++){
      console.log(socket[i]);
      req.app.io.to(socket[i]).emit('receiveMessage', message);
    }
    //req.app.io.emit('receiveMessage',message);

    jsonOutput.message = 'Uploaded successfully';
    return jsonOutput;
  } catch (e) {
    console.log(e);
  }
};



var clearChat = async(req, res) => {
  req.checkBody('conversation_id','Conversation id is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    try{
    var jsonOutput = {};
    var userId = await getUserId(req.body.session_id);

    var checkIfDeleted = await collection.UserMessagesModel.query(qb => {
                           qb.where('deleted_by_user1_id','!=',0);
                         }).fetch();
    if(checkIfDeleted != null){
      var markDeleted = await collection.UserMessagesModel.query({where : {conversation_id : req.body.conversation_id}})
                        .save({is_deleted : constants.MESSAGE_DELETED , deleted_by_user2_id : userId},{patch : true});
    } else {
      var markDeleted = await collection.UserMessagesModel.query({where : {conversation_id : req.body.conversation_id}})
                        .save({is_deleted : constants.MESSAGE_DELETED , deleted_by_user1_id : userId},{patch : true});      
    }

    } catch (e) {
        console.log(e);
    }

    jsonOutput.message = 'Chat has been cleared successfully';
    return jsonOutput;
  }  
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

var getUserId = async(sessionId) => {
  var appLogin = await collection.AppLoginModel.query({where : {session_id : sessionId}}).fetch();
  return appLogin.attributes.user_id;
}

module.exports = {
  getConversationListing,
  getConversationMessages,
  initializeConversation,
  muteConversation,
  clearChat,
  uploadChatImage
}
