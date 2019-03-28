const passwordHash = require('password-hash');
const randomString = require('randomstring');

const collection = require('./../../Database/Collections');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');
const push = require('./../../Library/Helpers/FCM');
const userMySql = require('./../../Library/CommonQueries/Users');

var login = async(req, res) => {
  req.checkBody('phone_number','Phone number/Username/Email is required').notEmpty();
  req.checkBody('password','Password is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    var result = await collection.UsersModel.query(qb => {
                   qb.leftJoin('user_mood','users.id','user_mood.user_id');
                   qb.leftJoin('moods','moods.id','user_mood.mood_id');
                   qb.where((qb) => {
                      qb.where('phone_number',req.body.phone_number).orWhere('username',req.body.phone_number).orWhere('email',req.body.phone_number);
                   })
                   qb.where('is_trashed','!=',constants.IS_TRASHED);
                   qb.where('is_blocked','!=',constants.IS_BLOCKED);
                 }).fetch({columns : ['users.id' ,'users.full_name', 'users.email' , 'users.country','users.password' , 'users.phone_number' , 'users.image',
                                      'users.age' , 'users.password' ,'users.city','users.username' , 'users.is_verified' ,'user_mood.mood_id','moods.emoji','moods.color','moods.name']});

    if(result==null){ //check if email and password exist in database
     throw 'Invalid login credentials';
    }
    else{
     if(!passwordHash.verify(req.body.password, result.attributes.password)){
       throw 'Incorrect password';
     }
     else{
       var updateOnlineStatus = await collection.UsersModel.query({where : {id : result.id}}).save({is_online : constants.IS_ONLINE} , {patch : true});
       var appLogin = await userMySql.getAppLogin(req,result.id); //create user session
       var jsonOutput = await userMySql.getUserProfile(result,appLogin);
       return jsonOutput;
     }
    }
  }
};

var socialLogin = async(req, res) => {
  try{
  //check if user has logged in with same ids before
  var facebookId = req.body.facebook_id ? req.body.facebook_id : 0;
  var googleId = req.body.google_id ? req.body.google_id : 0;

  var checkUser = await collection.UsersModel.query(qb => {
                   qb.where('facebook_id',facebookId);
                   qb.where('google_id',googleId);
                  }).fetch();

  if(checkUser==null){ //user is logging in first time with this id
    //check if user email already exists
    var checkUserEmail = await collection.UsersModel.query({where : {email : req.body.email}}).fetch();
    if(checkUserEmail!=null){ //update entry with same email
      var user = await collection.UsersModel.query({where : {email : req.body.email}}).save({'facebook_id' : facebookId , 'google_id' : googleId, 'full_name' : req.body.full_name,
                       image : req.body.image, email : req.body.email} , {patch : true});
    }
    else{ //create a new entry
      var username = 'user' + randomString.generate(5);
      var user = await collection.UsersModel.forge({'email' : req.body.email , 'image' : req.body.image , 'google_id' : googleId , 'facebook_id' :facebookId,
                    full_name : req.body.full_name, 'username' : username}).save();
      var updateUserMood = await collection.UserMoodModel.forge({user_id : user.attributes.id , mood_id : constants.DEFAULT_USER_MOOD}).save();
    }
  } else {
    var user = checkUser;
  }

  var user = await collection.UsersModel.query(qb => {
                  qb.where('facebook_id',facebookId);
                  qb.where('google_id',googleId);
             }).fetch();

  var updateOnlineStatus = await collection.UsersModel.query({where : {id : user.attributes.id}}).save({is_online : constants.IS_ONLINE} , {patch : true});

  var userInfo = await userMySql.getUserInfo(user.attributes.id);
  var appLogin = await userMySql.getAppLogin(req,user.attributes.id); //create user session
  var jsonOutput = await userMySql.getUserProfile(userInfo,appLogin);
} catch (e) {
  console.log(e);
}
  return jsonOutput;
};

module.exports = {
  login,
  socialLogin
}
