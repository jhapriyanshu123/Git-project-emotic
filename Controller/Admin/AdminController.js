const passwordHash = require('password-hash');

const collection = require('./../../Database/Collections');
const constants = require('./../../Library/Constants');
const requestErrors = require('./../../Library/Helpers/FetchErrors');

var login = async(req, res) => {
  var result = await collection.AdminModel.query({where : {email : req.body.email}}).fetch();
  if(result==null){
  	  res.render('Admin/pages/login', {error : 'Email does not exist'});
  }
  else{
    if(!passwordHash.verify(req.body.password, result.attributes.password)){
       res.render('Admin/pages/login' , {error : 'Incorrect password' , url : req.url});
    } else {
       var session = req.session;
       session.id = result.attributes.id;
       session.email = result.attributes.email;
       res.redirect('/dashboard');
    }
  } 
  return;
};

var showChangePassword = async(req, res) => { 
  var error = '';
  var success = '';
  res.render('Admin/pages/change_password', {error : error , success : success , url : req.url});
};

var changePassword = async(req, res) => {
  var error = '';
  var success = '';

  var getAdmin = await collection.AdminModel.query({where : {id : 1}}).fetch(); //check if admin entered the correct password
  if(!passwordHash.verify(req.body.old_password, getAdmin.attributes.password)){
     res.render('Admin/pages/change_password',{error : 'Incorrect password', success : success , url : req.url});
  }
  else{
     var newPassword = passwordHash.generate(req.body.new_password);
     var updatePassword = await collection.AdminModel.query({where : {id : 1}}).save({password : newPassword} , {patch : true});
     res.render('Admin/pages/change_password',{success : 'Password changed successfully' , error : error , url : req.url});
  }
};

var logout = async(req, res) => {
  req.session.destroy();
  res.redirect('/login');
};

module.exports = {
	login,
  showChangePassword,
  changePassword,
  logout
}