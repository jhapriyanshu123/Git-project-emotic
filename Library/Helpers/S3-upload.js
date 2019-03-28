const AWS = require('aws-sdk');
const fs = require('fs');
const path = require('path');
var multerS3 = require('multer-s3');
const multer = require('multer');

var CONFIG = require('./../../Config/config');

//configuring the AWS environment
AWS.config.update({
    accessKeyId: CONFIG.aws_access_key_id,
    secretAccessKey: CONFIG.AWS_SECRET_ACCESS_KEY
  });

var s3 = new AWS.S3();

//configuring parameters
// var params = {
//   Bucket: CONFIG.aws_bucket_name,
//   Body : fs.createReadStream(filePath),
//   Key : "Groups/"+Date.now()+"_"+path.basename(filePath)
// };

// s3.upload(params, function (err, data) {
//   //handle error
//   if (err) {
//     console.log("Error", err);
//   }

//   //success
//   if (data) {
//     console.log("Uploaded in:", data.Location);
//   }
// });
var upload = multer({
  storage: multerS3({
    s3: s3,
    bucket: CONFIG.aws_bucket_name,
    key: function (req, file, cb) {
      cb(null, Date.now()+file.originalname.replace(/\s+/g, '-'));
    }
  })
});

module.exports = upload;