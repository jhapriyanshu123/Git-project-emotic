const AWS = require('aws-sdk');
const CONFIG = require('./config');
 
const s3Client = new AWS.S3({
    accessKeyId: CONFIG.aws_access_key_id,
    secretAccessKey: CONFIG.aws_secret_access_key,
	region : CONFIG.aws_region
});
 
const uploadParams = {
         Bucket: CONFIG.aws_bucket_name, 
         Key: '', // pass key
         Body: null, // pass file body
};
 
const s3 = {};
s3.s3Client = s3Client;
s3.uploadParams = uploadParams;
 
module.exports = s3;