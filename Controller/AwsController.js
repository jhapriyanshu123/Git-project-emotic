var stream = require('stream');
 
const s3 = require('./../Config/s3.config.js');
const CONFIG = require('./../Config/config');
 
exports.doUpload = async (imageObj, image, folder) => {
	const s3Client = s3.s3Client;
	const params = s3.uploadParams;
	
	params.Bucket = CONFIG.aws_bucket_name + '/' + folder;
	params.Key = image;
	params.Body = imageObj.buffer;
	params.ContentType = imageObj.mimetype;
	params.ACL = 'public-read';
		
	s3Client.upload(params, (err, data) => {
		if (err) {
			console.log(err);
			return err;
		}
		else{
		//s3Client.getResourceUrl("your-bucket", "some-path/some-key.jpg");
		return image;
	}
	});
}