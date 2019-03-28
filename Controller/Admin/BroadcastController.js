const collection = require('./../../Database/Collections');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');
const userMySql = require('./../../Library/CommonQueries/Users');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const push = require('./../../Library/Helpers/FCM');


var showBroadcastPage = async(req, res) => {
  var success = '';
  res.render('Admin/pages/broadcast' , {url : req.url, success : success});
}

var broadcast = async(req, res) => {
  req.checkBody('title','Title is required').notEmpty();
  req.checkBody('message','Message is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
  	var users = await collection.Users.query(qb => {
                  qb.where('is_trashed','!=',constants.IS_TRASHED);
                  qb.where('is_blocked','!=',constants.IS_BLOCKED);
                  qb.orderBy('id','ASC');
  	            }).fetch();

    var pushData = {};
    pushData.push_type = constants.PUSH_TYPE_FOLLOW_REQUESTS;
    pushData.user = {};
    pushData.post = {};
    pushData.conversation = {};
    pushData.message_to_display = req.body.message + ' ' + req.body.title ;
    var notifyUser = await notifyReceiver(users, pushData);
    res.render('Admin/pages/broadcast',{success : 'Send', url : req.url});
  }
};

var notifyReceiver = async(users,data) => {
for(var i = 0 ; i < users.length ; i++){
 var tokens = await collection.AppLogin.query(qb => {
              qb.where('user_id',users.models[i].attributes.id);
              qb.whereNotNull('device_token');
              qb.orderBy('id','DESC');
             }).fetch();
if(tokens!=null){
  for(var i = 0; i < tokens.length ; i++){
    if(tokens.models[i].attributes.device_token){
      var sendPush = await push.sendPush('c2TjLKcya34:APA91bEqoR3UvMpjwfjgUpyKTsaBrd1NjCX51gWftNc_J_dq5iou8tMI_PynfSDVRv4oKI4Bf4d0CrWL4oyCXPK2b667QlqB1Upl8AHqLW--6RoGrWoNHHe964bKLCZOLOGa3XD25-h2',data,tokens.models[i].attributes.device_type,'Admin');
    }
  }
}
}
//var sendPush = await push.sendPush('c2TjLKcya34:APA91bEqoR3UvMpjwfjgUpyKTsaBrd1NjCX51gWftNc_J_dq5iou8tMI_PynfSDVRv4oKI4Bf4d0CrWL4oyCXPK2b667QlqB1Upl8AHqLW--6RoGrWoNHHe964bKLCZOLOGa3XD25-h2',data,'Android');

return;
};

module.exports = {
	broadcast,
	showBroadcastPage
}