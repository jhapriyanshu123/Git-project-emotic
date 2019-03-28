const moment = require('moment');

const collection = require('./../../Database/Collections');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');
const groupMySql = require('./../../Library/CommonQueries/Groups');
const userMySql = require('./../../Library/CommonQueries/Users');
const awsWorker = require('../AwsController');

var getGroup = async(req, res) => {
  req.assert('group_id','Group id is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    var userId = await getUserId(req.query.session_id);

    var groupInfo = await collection.UserGroupsModel.query({where : {id : req.query.group_id}}).fetch();
    if(groupInfo==null){
      throw 'Group id doesnt exist!';
    }
    var jsonOutput = await groupMySql.getGroupObject(groupInfo, userId);
    res.status(200).json(jsonOutput);
  } 
};

var createGroup = async(req, res) => {
  req.checkBody('name','Name is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    try{
    if(req.body.group_id != null && req.body.group_id != '' && req.body.group_id != 'null'){
      var groupId = req.body.group_id;
      var userId = await getUserId(req.body.session_id);
      if(req.file){
        var timestamp = moment().unix();
        var image = timestamp + req.file.originalname;
        var uploadImage = await awsWorker.doUpload(req.file, image, constants.S3_GROUPS);
      }
      var groupInfo = await collection.UserGroupsModel.query({where : {id : req.body.group_id}}).fetch();
      var logo = image ? image : groupInfo.attributes.logo;
      var name = req.body.name ? req.body.name : groupInfo.attributes.name;

      var updateGroup = await collection.UserGroupsModel.query({where : {id : req.body.group_id}}).save({logo : logo , name : name}, {patch : true});    

    } else {
      var image = '1548863927default.jpg';
      var groupMembers = JSON.parse(req.body.group_members);
      if(!Array.isArray(groupMembers)){
        throw 'Please enter group members in valid format';
      }
      var userId = await getUserId(req.body.session_id);
      if(req.file){
        var timestamp = moment().unix();
        var image = timestamp + req.file.originalname;
        var uploadImage = await awsWorker.doUpload(req.file, image, constants.S3_GROUPS);
      }
        var newGroup = await collection.UserGroupsModel.forge({admin_id : userId, name : req.body.name, logo : image}).save();
        var groupId = newGroup.attributes.id; 

        for(var i = 0 ; i<groupMembers.length; i++){
        var addGroupMembers = await collection.UserGroupMembersModel.forge({group_id : newGroup.attributes.id , user_id : groupMembers[i] , is_admin : 0}).save();
        }

        var addGroupMembers = await collection.UserGroupMembersModel.forge({group_id : newGroup.attributes.id , user_id : userId , is_admin : 1}).save();
        var conversation = await collection.UserConversationModel.forge({group_id : newGroup.attributes.id}).save();
        var newMessage = await collection.UserMessagesModel.forge({conversation_id : conversation.attributes.id ,sender_id : userId, message : '' ,
                      type: 1,timezone : req.body.timezone,for_group : 1}).save();
      }

    var groupInfo = await collection.UserGroupsModel.query({where : {id : groupId}}).fetch();
    var jsonOutput = await groupMySql.getGroupObject(groupInfo, userId);
    res.status(200).json(jsonOutput);

  } catch (e) {
    console.log(e);
  }

}
};

var updateGroupMembers = async(req, res) => {
  req.checkBody('group_id','Group id is required').notEmpty();
  req.checkBody('group_members', 'Group members is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    var hasUserId = 0;
    var jsonOutput = {};
    var userId = await getUserId(req.body.session_id);
    var groupMembers = JSON.parse(req.body.group_members);
    if(!Array.isArray(groupMembers)){
        throw 'Please enter group members in valid format';
    }

    var isAdmin = await collection.UserGroupMembersModel.query({where : {group_id : req.body.group_id, user_id : userId, is_admin : 1}}).fetch();
    if(isAdmin==null){
      throw 'You cannot update the members of this group';
    }

    var deleteGroupMembers = await collection.UserGroupMembersModel.query({where : {group_id : req.body.group_id}}).destroy();
    for(var i = 0 ; i<groupMembers.length; i++){
      if(groupMembers[i] == userId){
        var hasUserId = 1;
        var isAdmin = 1;
      } else {
        var isAdmin = 0;
      }
      var addGroupMembers = await collection.UserGroupMembersModel.forge({group_id : req.body.group_id , user_id : groupMembers[i] , is_admin : isAdmin}).save();
    }

    if(hasUserId == 0){
       var addGroupMembers = await collection.UserGroupMembersModel.forge({group_id : req.body.group_id , user_id : userId , is_admin : 1}).save(); 
    }   

    var groupInfo = await collection.UserGroupsModel.query({where : {id : req.body.group_id}}).fetch();
    var jsonOutput = await groupMySql.getGroupObject(groupInfo, userId);
    res.status(200).json(jsonOutput);
  }  
};

var leaveGroup = async(req, res) => {
  req.checkBody('group_id','Group id is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    var jsonOutput = {};
    try{
    var userId = await getUserId(req.body.session_id);
    var isAdmin = await collection.UserGroupMembersModel.query({where : {group_id : req.body.group_id, user_id : userId}}).fetch();

    var exitGroup = await collection.UserGroupMembersModel.query({where : {group_id : req.body.group_id, user_id : userId}}).destroy();

    if(isAdmin.attributes.is_admin == 1){
      var newAdmin = await collection.UserGroupMembersModel.query(qb => {
                      qb.where('group_id',req.body.group_id);
                      qb.orderBy('created_at','ASC');
                     }).fetch();
      var newAdmin = await collection.UserGroupMembersModel.query({where : {group_id : req.body.group_id, user_id : newAdmin.attributes.user_id}}).
                                                 save({is_admin : 1},{patch : true});
    }

    jsonOutput.message = 'Group has been left successfully';
    res.status(200).json(jsonOutput);

  } catch (e) {
    console.log(e);
  }

}
};

var updateGroupNotificationStatus = async(req, res) => {
  req.checkBody('status','Status is required').notEmpty();
  req.checkBody('group_id','Group id is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    try{
    var jsonOutput = {};
    var userId = await getUserId(req.body.session_id);
    var status = await collection.UserGroupMembersModel.query({where : {group_id : req.body.group_id, user_id : userId}}).fetch();
    if(status==null){
      throw 'You are not a member of this group';
    }
    // if(status.attributes.notification_enabled == 1){
    //   var status = 0;
    // } else {
    //   var status = 1;
    // }
    var updateStatus = await collection.UserGroupMembersModel.query({where : {group_id : req.body.group_id, user_id : userId}}).save({notification_enabled : req.body.status},{patch : true});
    jsonOutput.message = 'Notification status has been updated successfully';
    res.status(200).json(jsonOutput);
  } catch (e) {
    console.log(e);
  }
  }
};

var getUserId = async(sessionId) => {
  var appLogin = await collection.AppLoginModel.query({where : {session_id : sessionId}}).fetch();
  return appLogin.attributes.user_id;
}

module.exports = {
  createGroup,
  leaveGroup,
  updateGroupNotificationStatus,
  getGroup,
  updateGroupMembers
}
