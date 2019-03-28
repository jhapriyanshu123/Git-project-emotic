const axios = require('axios');

const collection = require('./../../Database/Collections');
const constants = require('./../../Library/Constants');
const requestErrors = require('./../../Library/Helpers/FetchErrors');
const userMySql = require('./../../Library/CommonQueries/Users');

var getUsers = async(req, res) => {
  var resultCount = generatePagination(req.query.page);
  if(req.query.user_search){
  	var search = req.query.user_search;
    search = search.replace(/^\s+/g, '');
  	var searchParam = '%'+search+'%';
  	var users = await collection.Users.query(qb => {
                 qb.where('full_name','like',searchParam);
                 qb.orWhere('username','like',searchParam);
                 qb.where('users.is_trashed','!=',constants.IS_TRASHED);
                 qb.offset(resultCount.skip);
                 qb.limit(resultCount.limit);
                 qb.orderBy('id','DESC');
            	}).fetch();
    var paginationUsers = await getTotalUsers(1,searchParam);
    var totalPages = await getPagelinks(paginationUsers);
  } else {
  	var search = '';
  	var users = await collection.Users.query(qb => {
                 qb.where('users.is_trashed','!=',constants.IS_TRASHED);
                 qb.offset(resultCount.skip);
                 qb.limit(resultCount.limit);
                 qb.orderBy('id','DESC');
            	}).fetch();  	
    var paginationUsers = await getTotalUsers(2);
    var totalPages = await getPagelinks(paginationUsers);
  }
  res.render('Admin/pages/users',{users : users , user_search : search, page : req.query.page, pages : totalPages, url : req.url});
};

var getTotalUsers = async(type, searchParam=null) => {
  if(type == 1){
    var users = await collection.Users.query(qb => {
                 qb.where('full_name','like',searchParam);
                 qb.orWhere('username','like',searchParam);
                 qb.where('users.is_trashed','!=',constants.IS_TRASHED);
                 qb.orderBy('id','DESC');
              }).count();
  } else {
    var users = await collection.Users.query(qb => {
                 qb.where('users.is_trashed','!=',constants.IS_TRASHED);
                 qb.orderBy('id','DESC');
              }).count();   
  }
  return users;
};

var viewUser = async(req, res) => {
 var user = await collection.UsersModel.query(qb => {
               qb.where('users.id',req.query.user_id);
               qb.leftJoin('user_mood','user_mood.user_id','users.id');
               qb.leftJoin('moods','moods.id','user_mood.mood_id');
               qb.where('users.is_trashed','!=',constants.IS_TRASHED);
             }).fetch({columns : ['users.id' ,'users.full_name', 'users.email' , 'users.country','users.password' , 'users.phone_number' , 'users.image','users.password',
                                  'users.age' , 'users.city','users.username' , 'users.is_verified' ,'user_mood.mood_id','moods.name','moods.emoji','moods.color','users.is_blocked']});
 
  var userImage = await getImageUrl(user.attributes.image);
  res.render('Admin/pages/user_detail',{user : user , image : userImage.image , imgType : userImage.type, url : req.url});
};

var getImageUrl = async(image) => {
  var imgObj = {};
  if(image!=null){
   var containsHttp = image.includes('http');
   var containsHttps = image.includes('https');
   if (containsHttp === true || containsHttps === true) {
     if (image.includes('googleusercontent')) { 
       var image = image;
       imgObj.image = image;
       imgObj.type = 2;
     } else {
       var url = 'https://www.facebook.com/plugins/post/oembed.json/?url=' + image;
       var html = await axios.get(url);
       var image = await renderHtml(html); 
       imgObj.image = image;
       imgObj.type = 1;   
     }
   } else {
     var image = constants.USER_IMAGE_PATH + image;
     imgObj.image = image;
     imgObj.type = 2;
   }
  }
  return imgObj;
};

var renderHtml = async(image) => {
  return image.data.html;
};

var blockUser = async(req, res) => {
  var changeUserStatus = await collection.UsersModel.query(qb => {
                   qb.where('id',req.body.user_id);
                  }).save({is_blocked : req.body.status}, {patch : true});
  res.redirect('view-user?user_id='+ req.body.user_id);
};

var verifyUser = async(req, res) => {
  var changeUserStatus = await collection.UsersModel.query(qb => {
                   qb.where('id',req.body.user_id);
                  }).save({is_verified : req.body.status}, {patch : true});
  res.redirect('view-user?user_id='+ req.body.user_id);
}

var removeUser = async(req, res) => {
  var trashUser = await collection.UsersModel.query(qb => {
                   qb.where('id',req.query.user_id);
                  }).save({is_trashed : constants.IS_TRASHED}, {patch : true});
  res.redirect('users');
};

var showAddUser = async(req, res) => {
  var moods = await collection.Moods.query(qb => {
                 qb.orderBy('name','ASC');
              }).fetch();
  var error = {};
  res.render('Admin/pages/add_users',{moods : moods , error : error, url : req.url});
};

var addUser = async(req, res) => {
  //validate
  var isNameValid = await validateCredentials('username',req.body.username);
  if(!isNameValid){
      res.redirect('add_user',{error : 'Username already in use'});
  }
  var isPhoneNumberValid = await validateCredentials('phone_number',req.body.phone_number);
  if(!isPhoneNumberValid){
      res.redirect('add_user',{error : 'Phone number already in use'});
  }
  var isEmailValid = await validateCredentials('email',req.body.email);
  if(!isEmailValid){
      res.redirect('add_user',{error : 'Email already in use'});
  }
  var isAgeValid = await validateAge(req.body.age);
  if(!isAgeValid){
      res.redirect('add_user',{error : 'Please enter valid age'});
  }
};

var getPagelinks = (count) => {
  var pages = count/15;
  return Math.ceil(pages);
};

var generatePagination = (page) => {
  var limit = 15;
  var skip = page ? (page-1) * limit : 0;
  var pagesVar = {};
  pagesVar.limit = limit;
  pagesVar.skip = skip;
  return pagesVar;
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

module.exports = {
	getUsers,
	viewUser,
  blockUser,
	removeUser,
  verifyUser,
  showAddUser,
  addUser
}