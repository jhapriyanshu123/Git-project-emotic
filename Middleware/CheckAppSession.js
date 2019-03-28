const collection = require('./../Database/Collections');

var appAuth = async(req ,res ,next) => {
var sessionId = req.body.session_id;
if(!sessionId){
  sessionId = req.query.session_id;
}
if(!sessionId){
  var error = {};
  error.error = 'unauthorized';
  error.error_description = 'Unauthorized request.';
  res.status(401).json(error);
}
else{
  var result = await collection.AppLoginModel.query({where : {session_id : sessionId}}).fetch();
  if(result==null){
    var error = {};
    error.error = 'forbidden';
    error.error_description = 'Your session has been expired.';
    res.status(403).json(error);
  }
  else{
    next();
  }
}
}

module.exports = {
  appAuth
};
