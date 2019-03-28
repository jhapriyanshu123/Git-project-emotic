const jimp = require('jimp');
const path = require('path');

const libFunction = require('./../../Library/functions');
const constants = require('./../../Library/Constants');

var imageProcess = async(req, res ,next) => {
  
   var folder = req.params.folder;
   // var subFolder = req.params.subfolder;
   var image = req.params.image;
   var extension = path.extname(image);
   var extUrl = await libFunction.checkExtension(folder,image,extension);
   if(extUrl){
    var contentType = await libFunction.getMimeType(extension);
    console.log(contentType);

    var root = await libFunction.getRoot();
    var pathToFile = constants.S3_BUCKET_PATH + constants.S3_POST_GIF + '/' + image;
    console.log(pathToFile);

    res.set("Content-Type", contentType);
    // res.sendFile(image, { root: pathToFile });
    res.send(pathToFile);

    // res.sendFile(extUrl);
   }
   else{
   if(req.params.w){
     var width = parseInt(req.params.w, 10);
   }
   // else{
   //   var width = 500;
   // }
   if(req.params.h){
     var height = parseInt(req.params.h, 10);
   }
   // else{
   //   var height = 500;
   // }


 // var input = '/var/www/html/Emotic/Public/img/' + folder + '/' + image;
   if(folder == constants.IMAGE_POST_FETCH){

     var input = constants.S3_BUCKET_PATH + constants.S3_POST_IMAGES  + '/' + image;

   } else if(folder == constants.VIDEO_POST_FETCH){

     var input = constants.S3_BUCKET_PATH + constants.S3_POST_VIDEOS  + '/' + image;

   } else if(folder == constants.GIF_POST_FETCH){

     var input = constants.S3_BUCKET_PATH + constants.S3_POST_GIF  + '/' + image;

   } else if(folder == constants.THUMB_POST_FETCH){
    
     var input = constants.S3_BUCKET_PATH + constants.S3_POST_VIDEOS_THUMB  + '/' + image;

   } else{
      var input = constants.S3_BUCKET_PATH + folder  + '/' + image;
   }
  

 var ratio = height / width;


jimp.read(input, function(err, img) {
  if(err){
      console.log(input);
      console.log(err);
  } else {
       if(width || height){
        if(width && !height){
          img.scaleToFit(width,jimp.AUTO).quality(60).getBuffer(jimp.AUTO, function(err, buffer){
           if(err) {
            console.log(err);
           }
           else{
            res.set("Content-Type", jimp.AUTO);
            res.send(buffer);
           }
        });
        } else if(!width && height){
          img.scaleToFit(jimp.AUTO,height).quality(60).getBuffer(jimp.AUTO, function(err, buffer){
           if(err) {
            console.log(err);
           }
           else{
            res.set("Content-Type", jimp.AUTO);
            res.send(buffer);
           }
        });
        } else if(width && height){
          img.scaleToFit(width,height).quality(60).getBuffer(jimp.AUTO, function(err, buffer){
           if(err) {
            console.log(err);
           }
           else{
            res.set("Content-Type", jimp.AUTO);
            res.send(buffer);
           }
        });
        };  
        }      
       else{
         img.quality(60).getBuffer(jimp.AUTO, function(err, buffer){
           if(err) {
            console.log(err);
           }
           else{
            res.set("Content-Type", jimp.AUTO);
            res.send(buffer);
           }
        });          
       }   
  }
});
}
};



module.exports = {
  imageProcess
}
