var nodemailer = require('nodemailer');
var CONFIG = require('./../../Config/config');

var sendEmail = (email, recoveryLink) => {
var transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: CONFIG.mail_id,
    pass: CONFIG.mail_password
  }
});

var mailOptions = {
  from: CONFIG.mail_id,
  to: email,
  subject: 'Emotic',
  text: recoveryLink
};

transporter.sendMail(mailOptions, function(error, info){
  if (error) {
    console.log(error);
  } else {
    console.log('Email sent: ' + info.response);
  }
});
}

module.exports = {
  sendEmail
}
