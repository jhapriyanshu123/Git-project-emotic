const collection = require('./../../Database/Collections');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');
const userMySql = require('./../../Library/CommonQueries/Users');
const timeFunction = require('./../../Library/TimeFunctions');

var createNewGroup = async(adminId, name , description , logo) => {
  var newGroup = await collection.UserGroupsModel.forge({admin_id : adminId, name : name , description : description,
                 logo : logo}).save();
  return newGroup;               
};


var getGroupObject = async(group, userId) => {
  var jsonOutput = {};
  var membersObj = await getGroupMembers(group.attributes.id);
  var num_participants = await collection.UserGroupMembers.query({where : {group_id : group.attributes.id}}).count();

  //check if logged in user is the admin
  var isAdmin = await checkIfAdmin(userId,group.attributes.id);

  jsonOutput.is_admin = isAdmin ? 1 : 0;
  jsonOutput.group_id = group.attributes.id;
  jsonOutput.group_name = group.attributes.name;
  jsonOutput.logo = constants.GROUP_IMAGE_PATH + group.attributes.logo;
  jsonOutput.num_members = num_participants;
  jsonOutput.group_members = membersObj;
  return jsonOutput;
};

var getGroupMembers = async(groupId) => {
  var membersObj = [];
  var members = await collection.UserGroupMembers.query({where : {group_id : groupId}}).fetch();
  for(var i = 0 ; i < members.length ; i++){
    var user = await userMySql.getUserInfo(members.models[i].attributes.user_id);
    var userProfile = await userMySql.getUserProfile(user);

    var memberAdmin = await checkIfAdmin(members.models[i].attributes.user_id, groupId);
    if(memberAdmin){
      var isAdmin = 1;
    } else {
      var isAdmin = 0;
    }
    userProfile.is_admin = isAdmin;
    membersObj.push(userProfile);
  }
  return membersObj;
};

var checkIfAdmin = async(userId, groupId) => {
  var isAdmin = await collection.UserGroupMembersModel.query({where : {group_id : groupId, user_id : userId}}).fetch();
  if(isAdmin.attributes.is_admin == 1){
  	return true;
  } else {
  	return false;
  }
};

module.exports = {
  createNewGroup,
  getGroupObject
}
