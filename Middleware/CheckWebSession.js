const collection = require('./../Database/Collections');

var webAuth = async(req ,res ,next) => {
var session = req.session;
if(session.email && session.id){
  next();
}
else {
  res.redirect('/login');
}

}

module.exports = {
  webAuth
};
