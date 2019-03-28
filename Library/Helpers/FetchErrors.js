var checkErrors = async (req) => {
var errors = await req.validationErrors();
if(errors.err){
  throw errors.err;
  return;
}
else{
  var msg = {};
  if(errors){
    msg.error = "bad request";
    errors.forEach((err) => {
      msg.error_description = err.msg;
    })
  return msg;
  }
  else{
    return;
  }
}
};

module.exports = {
  checkErrors
}
