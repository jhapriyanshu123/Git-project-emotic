const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
  destination : (req, file, callback) => {
    // var newDestination = 'Public/img/user';
    var url = req.originalUrl;
    var newDest = url.replace('/api/v1/','');
    if(newDest=='signup' || newDest=='edit-profile'){
    	var newDestination = 'Public/img/user';
    }
    else{
        var newDestination = 'Public/img/' + newDest;
    }    
    callback(null, newDestination);
  },
  filename : (req, file, callback) => {
    callback(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
  }
});

const upload = multer({ storage : storage });

module.exports = upload;
