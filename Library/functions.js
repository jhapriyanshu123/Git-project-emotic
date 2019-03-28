const path = require('path');

const constants = require('./../Library/Constants');

var checkExtension = async(folder,image,extension) => {
  if(extension == '.jpeg' || extension == '.png' || extension == '.tiff' || extension == '.bmp' || extension == '.jpg'){
  	return false;
      
  }
  else{
      return true;
  }
};

var getRoot = async() => {
	return path.dirname(require.main.filename || process.mainModule.filename);
}

var getMimeType = async(extension) => {
	var extension = extension.replace('.', ""); 
    var mimeType = 'image/' + extension;
    return mimeType;
};

module.exports = {
  checkExtension,
  getRoot,
  getMimeType
}
