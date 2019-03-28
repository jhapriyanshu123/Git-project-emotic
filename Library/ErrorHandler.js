var errorHandler = (err, req, res, next) => {
  if(typeof(err) == 'string'){
    //custom application error
    res.status(400).json({error_description : err});
  }

  if(err.name == 'ValidationError'){
    //mongoose validation error
    res.status(400).json({error_description : err.message});
  }

  if(err.name == 'UnAuthorizedError'){
    //mongoose validation error
    res.status(401).json({error_description : 'Invalid Token'});
  }

  // default to 500 server error
  //return res.status(500).json({ message: err.message });
};

module.exports = errorHandler;
