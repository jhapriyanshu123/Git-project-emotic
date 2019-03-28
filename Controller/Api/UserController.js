const randomString = require('randomstring');
const passwordHash = require('password-hash');
const moment = require('moment');

const collection = require('./../../Database/Collections');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');
const userMySql = require('./../../Library/CommonQueries/Users');
const postMySql = require('./../../Library/CommonQueries/Posts');
const mail = require('./../../Library/Helpers/SendMail');
const awsWorker = require('../AwsController');

var signup = async(req, res) => {
    req.checkBody('full_name','Name is requireed').notEmpty();
    req.checkBody('username','Username is required').notEmpty();
    req.checkBody('phone_number','Phone number is required').notEmpty();
    req.checkBody('email','Email is required').notEmpty().isEmail();
    req.checkBody('password','Password is required').notEmpty();
    var requestResult = await requestErrors.checkErrors(req);
    if(requestResult){
      res.status(400).json(requestResult);
    }
    else{
      //check username
      if (/\s/.test(req.body.username)) {
        throw 'Please enter valid username';
        // It has any kind of whitespace
      }
      //validate
      var isNameValid = await validateCredentials('username',req.body.username);
      if(!isNameValid){
        throw 'Username ' + req.body.username + ' is already in use!';
      }
      var isPhoneNumberValid = await validateCredentials('phone_number',req.body.phone_number);
      if(!isPhoneNumberValid){
        throw 'Phone number ' + req.body.phone_number + ' is already in use!';
      }
      var isEmailValid = await validateCredentials('email',req.body.email);
      if(!isEmailValid){
        throw 'Email ' + req.body.email + ' is already in use!';
      }
      var isAgeValid = await validateAge(req.body.age);
      if(!isAgeValid){
        throw 'Please enter valid age';
      }

        try{
        var jsonOutput = {};
        if(req.file){
          var timestamp = moment().unix();
          var image = timestamp + req.file.originalname;
          var uploadImage = await awsWorker.doUpload(req.file, image, constants.S3_USERS);
        }
        var password = passwordHash.generate(req.body.password);
        var image = req.file ? req.file.originalname : constants.DEFAULT_USER_IMAGE;
        var otp = '1234';
        var age = req.body.age ? req.body.age : 0;

        if(await collection.TempUserModel.query(qb => {qb.where('phone_number',req.body.phone_number);}).fetch() != null){
          var updateUser = await collection.TempUserModel.query({where : {phone_number : req.body.phone_number}}).save({email : req.body.email , 
                                 password : password , country : req.body.country , city : req.body.city, age : age, 
                                 phone_number : req.body.phone_number ,country_code : req.body.country_code,full_name : req.body.full_name, username : req.body.username, image : image, otp : otp} , 
                                 {patch : true});
        }
        else{
          var newUser = await collection.TempUserModel.forge({email : req.body.email , password : password , country : req.body.country ,
                              city : req.body.city, age : age, phone_number : req.body.phone_number ,country_code : req.body.country_code,full_name : req.body.full_name,
                              username : req.body.username, image : image, otp : otp}).save();          
        }

        var user = await collection.TempUserModel.query({where : {phone_number : req.body.phone_number}}).fetch();
        var sessionId = await userMySql.getAppLogin(req,user.attributes.id); //create user session

        var otp = otp;
        var email = mail.sendEmail(req.body.email , otp); //send mail
        jsonOutput.message = 'An OTP has been sent to your email';
      } catch (e) {
        console.log(e);
      }
         return jsonOutput;
    }
};

var validateCredentials = async(credential,userCredential) => {
    var isUser = await collection.UsersModel.query(qb => {
                 qb.where((qb) => {
                   qb.where(credential,userCredential);
                 })
                 qb.where('is_trashed','!=',constants.IS_TRASHED);
                 qb.where('is_blocked','!=',constants.IS_BLOCKED);
                 }).fetch();
    if(isUser != null){
      return false; //credential in use
    }
    else{
      return true;
    }
};

var validateAge = async(age) => {
  if(age > 150 || age < 0) {
    return false;
  } else {
    return true;
  }
};

var verifyOtp = async(req, res) => {
    req.checkBody('phone_number','Phone number is requireed').notEmpty();
    req.checkBody('otp','otp is required').notEmpty();
    var requestResult = await requestErrors.checkErrors(req);
    if(requestResult){
      res.status(400).json(requestResult);
    }
    else{
      //validate
      if(await collection.TempUserModel.query(qb => {
               qb.where('phone_number',req.body.phone_number);
               qb.where('otp',req.body.otp);
      }).fetch() == null){
        throw 'Incorrect otp';
      }
      else{
        if(await collection.TempUserModel.query(qb => {
                 qb.where('phone_number',req.body.phone_number);
                 qb.where('is_otp_verified',constants.IS_OTP_VERIFIED);
          }).fetch() != null){
             throw 'Your phone number has already been verified';
        }
        else{
          var jsonOutput = {};

          var user = await collection.TempUserModel.query({where : {phone_number : req.body.phone_number}}).fetch();
          var newUser = await collection.UsersModel.forge({email : user.attributes.email , password : user.attributes.password , country : user.attributes.country ,
                              city : user.attributes.city, age : user.attributes.age, phone_number : user.attributes.phone_number ,country_code : user.attributes.country_code,
                              full_name : user.attributes.full_name, username : user.attributes.username, image : user.attributes.image}).save();
          
          var updateUserMood = await collection.UserMoodModel.forge({user_id : newUser.attributes.id , mood_id : constants.DEFAULT_USER_MOOD}).save();
          //mark as otp verified
          var markVerified = await collection.TempUserModel.query({where : {phone_number : req.body.phone_number}}).
                             save({is_otp_verified : constants.IS_OTP_VERIFIED} , {patch : true});

          //get session
          var session = await getSession(user.attributes.id, newUser.attributes.id);//get user session
          var getUser = await userMySql.getUserInfo(newUser.attributes.id);
          var jsonOutput = await userMySql.getUserProfile(getUser, session.attributes.session_id);
        }
         return jsonOutput;
      }
    }
};

var getSession = async(userId, updatedUserId) => {
  var session = await collection.AppLoginModel.query(qb => {
                      qb.where('user_id',userId);
                      qb.orderBy('id','DESC');
                }).fetch(); //get user session
  //update user id
  var updateSession = await collection.AppLoginModel.query({where : {user_id : userId}}).save({user_id : updatedUserId}, {patch : true});
  var userSession = await collection.AppLoginModel.query(qb => {
                      qb.where('user_id',updatedUserId);
                      qb.orderBy('id','DESC');
                }).fetch(); //get user session
  return userSession;
};

var sendOtp = async(req, res) => {
    req.checkBody('phone_number','Phone number is requireed').notEmpty();
    var requestResult = await requestErrors.checkErrors(req);
    if(requestResult){
      res.status(400).json(requestResult);
    }
    else{
        if(await collection.TempUserModel.query(qb => {
                 qb.where('phone_number',req.body.phone_number);
                 qb.where('is_otp_verified',constants.IS_OTP_VERIFIED);
          }).fetch() != null){
             throw 'Your phone number has already been verified';
        }
        else{
          var jsonOutput = {};

          var user = await collection.TempUserModel.query({where : {phone_number : req.body.phone_number}}).fetch();
          var user = await collection.TempUserModel.query(qb => {
                       qb.where('phone_number',req.body.phone_number);
                       qb.where('is_otp_verified','!=',constants.IS_OTP_VERIFIED);
                     }).fetch();

          var recoveryLink = '1234';
          var email = mail.sendEmail(user.attributes.email , recoveryLink); //send mail
          jsonOutput.message = 'OTP has been resent to your registered email';
        }
         return jsonOutput;
    }
};

var editProfile = async (req, res) => {
  req.checkBody('email','Invalid email').notEmpty().isEmail();
  req.checkBody('phone_number','Invalid Phone number').notEmpty();
  req.checkBody('full_name','Full name is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    if(req.body.age){
      var isAgeValid = await validateAge(req.body.age);
      if(!isAgeValid){
        throw 'Please enter valid age';
      }
    }
    var userId = await getUserId(req.body.session_id);
    if(await collection.UsersModel.query(qb => {
                          qb.where(qb => {
                             qb.where('email',req.body.email);
                             qb.orWhere('phone_number',req.body.phone_number);
                             qb.orWhere('username',req.body.username);
                          });
                          qb.where('is_trashed','!=',constants.IS_TRASHED);
                          qb.where('is_blocked','!=',constants.IS_BLOCKED);
                          qb.where('id','!=',userId);
        }).fetch() != null){ //check if a user with same email or phoneNumber
          throw 'Email/phone number/username already exists';
    }
    else{
      try{
        var age = req.body.age ? req.body.age : 0;
        if(req.file){
          var timestamp = moment().unix();
          var image = timestamp + req.file.originalname;
          var uploadImage = await awsWorker.doUpload(req.file, image, constants.S3_USERS);

          var updateUser = await collection.UsersModel.query({where : {id : userId}}).save({email : req.body.email , phone_number : req.body.phone_number ,
                                                     full_name : req.body.full_name , country : req.body.country,country_code : req.body.country_code,city : req.body.city,
                                                     age : age, image : image, username : req.body.username} ,{patch : true});
      }
      else{
        var updateUser = await collection.UsersModel.query({where : {id : userId}}).save({email : req.body.email , phone_number : req.body.phone_number ,
                                                     full_name : req.body.full_name , country : req.body.country ,country_code : req.body.country_code,city : req.body.city,
                                                     age : age , username : req.body.username} ,{patch : true});
      }

      var user = await userMySql.getUserInfo(userId);
      var jsonOutput = await userMySql.getUserProfile(user);
      return jsonOutput;
    } catch (e) {
      console.log(e);
    }
    }
  }
};

var getUserProfile = async(req, res) => {
  var currentUserId = await getUserId(req.query.session_id);
  var userId = req.query.user_id ? req.query.user_id : await getUserId(req.query.session_id);
  var limit = req.query.limit ? req.query.limit : 10;
  var skip = req.query.page ? (req.query.page-1) * limit : 0
  var jsonOutput = {};
  try{
  var user = await userMySql.getUserInfo(userId);
  } catch (e) {
    console.log(e);
  }
  
  var userPosts = await getUserPosts(userId,limit,skip);

  var userProfile = await userMySql.getUserProfile(user,null,constants.REQUIRE_POSTS,currentUserId);
  jsonOutput.profile = userProfile.profile;
  jsonOutput.total_posts = userProfile.total_posts;
  jsonOutput.posts = await postMySql.getPostsOutput(userPosts,req.query.timezone);

  return jsonOutput;
};

// var getUserProfileOutput = async(user) => {
//   var userOutput = {};
//   try{
//   for(var i = 0; i<user.length ; i++){
//     var posts = await getUserPosts(user.models[i].attributes.user_id);
//     var numFollowers = await userMySql.getTotalFollowers(user.models[i].attributes.user_id);
//     var numFollowing = await userMySql.getTotalFollowing(user.models[i].attributes.user_id);
//     var numPosts = await getTotalPosts(user.models[i].attributes.user_id);

//     userOutput.followers_count   = numFollowers;
//     userOutput.following_count   = numFollowing;
//     userOutput.full_name   = user.models[i].attributes.full_name;
//     userOutput.username    = user.models[i].attributes.username;
//     userOutput.image       = constants.USER_IMAGE_PATH + user.models[i].attributes.image;
//     userOutput.mood_id     = user.models[i].attributes.mood_id;
//     // userOutput.mood_icon   = user.models[i].attributes.emoji;
//     userOutput.total_post  = numPosts;
//   }
//   userOutput.posts = posts;
// } catch (e) {
//   console.log(e);
// }
//   return userOutput;
// };

var getUserPosts = async (userId,limit,skip) => {
  try{
  var posts = await collection.UserPosts.query(qb => {
               qb.leftJoin('users','user_posts.user_id','users.id');
               qb.leftJoin('user_mood','user_mood.user_id','users.id');
               qb.leftJoin('post_mood','post_mood.post_id','user_posts.id');
               qb.where('user_posts.user_id',userId);
               qb.where('user_posts.is_deleted','!=',constants.IS_POST_DELETED);
               qb.where('user_posts.is_removed','!=',constants.IS_POST_REMOVED);
               qb.offset(skip);
               qb.limit(limit);
               qb.groupBy('user_posts.id');
               qb.orderBy('user_posts.id','DESC');
              }).fetch({columns : ['user_posts.id', 'user_posts.title' , 'user_posts.description' , 'user_posts.media' , 'user_posts.is_by_admin','user_posts.created_at',
                                  'users.username' ,'users.image' , 'user_posts.timezone','user_mood.mood_id','user_posts.type','users.id as user_id','user_posts.youtube_video_title',
                                  'user_posts.youtube_video_description','user_posts.youtube_video_thumb','user_posts.video_thumb','user_posts.gif_image_url','user_posts.youtube_video_id']});
            } catch (e) {
              console.log(e);
            }

  return posts;
};


var changePassword = async (req, res) => {
  req.checkBody('new_password','New password is required').notEmpty();
  req.checkBody('old_password','Old password is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
    res.status(400).json(requestResult);
  }
  else{
    var userId = await getUserId(req.body.session_id);
      var getUser = await collection.UsersModel.query({where : {id : userId }}).fetch(); //check if user entered the correct password
      if(!passwordHash.verify(req.body.old_password, getUser.attributes.password)){
        throw 'Incorrect password';
      }
      else{
        var newPassword = passwordHash.generate(req.body.new_password);
        var updatePassword = await collection.UsersModel.query({where : {id : userId}}).save({password : newPassword} , {patch : true});
        var jsonOutput = {};
        jsonOutput.message = 'Your password has been changed successfully';
        return jsonOutput;
    }
  }
};

var forgotPassword = async (req, res) => {
  req.checkBody('email','Email is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
  res.status(400).json(requestResult);
  }
  else{
  var email = req.body.email;
  var checkUser = await collection.UsersModel.query(qb => {
                    qb.where('email',email);
                    qb.where('is_trashed','!=',constants.IS_TRASHED);
                    qb.where('is_blocked','!=',constants.IS_BLOCKED);
                  }).fetch(); //check if entered email exists in db
  if(checkUser!=null){
  var userId = checkUser.attributes.id;
  var token = randomString.generate(32); //generate a token for reset password request

  var newToken = await collection.TokensModel.forge({user_id : userId , token : token}).save();
  //send mail
  var recoveryLink = 'http://52.35.47.59:3000/api/reset-password/' + token;
  var email = mail.sendEmail(email , recoveryLink); //send mail

  var jsonOutput = {};
  jsonOutput.message = 'Please check your email for recovery link';
  res.status(200).json(jsonOutput);
  }
  else{ //throw an error if email doesnt exist in db
    throw 'Email doesnt exist';
  }
}
};

var showResetPassword = async (req, res) => {
  var token = req.params.token;
  res.render('email/resetPassword', {token : token});
}

var resetPassword = async (req, res) => {
  var newPassword = req.body.new_password;
  var confirmPassword = req.body.confirm_password;
  var token = req.body.token;
  var user = await collection.TokensModel.query({where : {token : token}}).fetch();
  if(user!=null){
  var userId = user.attributes.user_id;
  var password = passwordHash.generate(req.body.new_password);
  var updatePassword = await collection.UsersModel.query({where : {id : userId}}).save({password : password} , {patch : true});
  var updateToken = await collection.TokensModel.query({where : {user_id : userId}}).destroy(); //delete token after password update
  var jsonOutput = {};
  jsonOutput.message = 'Your password has been reset successfully';
  return jsonOutput;
  }
  else{
    throw 'Oops!Looks like something went wrong!';
  }
};

var blockUser = async(req, res) => {
  req.checkBody('user_id','User id is required').notEmpty();
  var requestResult = await requestErrors.checkErrors(req);
  if(requestResult){
  res.status(400).json(requestResult);
  }
  else{
    var jsonOutput = {};
    var userId = await getUserId(req.body.session_id);
    if(await collection.UserBlockedModel.query({where : {user_id : userId, blocked_user_id : req.body.user_id}}).fetch() != null){
      //if the user is blockd, unblock user
      var block = await collection.UserBlockedModel.query({where : {user_id : userId, blocked_user_id : req.body.user_id}}).destroy();
      jsonOutput.message = 'User has been unblocked';
    } else {
      //block user
      var block = await collection.UserBlockedModel.forge({user_id : userId, blocked_user_id : req.body.user_id}).save();
      jsonOutput.message = 'User has been blocked';
    }

    return jsonOutput;
  }
};

var getBlockedUser = async(req, res) => {
  try{
  var jsonOutput = [];
  var userId = await getUserId(req.query.session_id);
  var users = await collection.UserBlocked.query(qb => {
                qb.leftJoin('users','users.id','user_blocked.blocked_user_id');
                qb.where('user_blocked.user_id',userId);
              }).fetch({columns : ['users.id', 'users.image' , 'users.full_name' , 'users.username','users.country','users.country_code',
                                   'users.phone_number','users.city','users.email','users.password','users.age','users.is_verified']});

  for(var i = 0; i < users.length ; i++){
    var userObj = {};
    var userProfile = await userMySql.getUserProfile(users.models[i],null,null,userId);
    jsonOutput.push(userProfile);
  }       
  return jsonOutput;
} catch (e) {
  console.log(e);
}
};

var getBlockedUserOutput = async(users) => {
  var userOutput = [];
  for(var i = 0; i < users.length ; i++){
    var user = {};
    var image = await userMySql.getImageUrl(users.models[i].attributes.image);
    user.username = users.models[i].attributes.username;
    user.full_name = users.models[i].attributes.full_name;
    user.image = image;
    userOutput.push(user);
  }
  return userOutput;
};

var logout = async (req, res) => {
  var userId = await getUserId(req.body.session_id);
  var logout = await collection.AppLoginModel.where('session_id',req.body.session_id).destroy();
  var updateOnlineStatus = await collection.UsersModel.query({where : {id : userId}}).save({is_online : constants.IS_OFFLINE} , {patch : true});
  var jsonOutput = {};
  jsonOutput.message = 'You have been logged out';
  res.status(200).json(jsonOutput);
};

var getUserId = async(sessionId) => {
  var appLogin = await collection.AppLoginModel.query({where : {session_id : sessionId}}).fetch();
  return appLogin.attributes.user_id;
}

module.exports = {
  signup,
  verifyOtp,
  editProfile,
  changePassword,
  forgotPassword,
  showResetPassword,
  resetPassword,
  blockUser,
  getUserProfile,
  logout,
  getBlockedUser,
  sendOtp
}
