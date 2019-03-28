const FCM = require('fcm-push');
const config = require('./../../Config/config');

var sendPush = async (device_token,data,device_type,username=null) => {
var serverKey = config.FCM_SERVER_KEY;
var fcm = new FCM(serverKey);

if(device_type=='Android' || device_type=='android'){
var message = {
    to: device_token, // required fill with device token or topics
    // collapse_key: 'your_collapse_key',
    // data: {
    //     "hello": 'your_custom_data_value'
    // }
    // notification: {
    //     title: title,
    //     body: body
    // }
    data : data
};
} else {
 var body = username + ' sent you a message';
 var message = {
    to: device_token, // required fill with device token or topics
    // collapse_key: 'your_collapse_key',
    // data: {
    //     "hello": 'your_custom_data_value'
    // }
    notification: {
        sound: 'default',
        body: body,
    },
    data : data
};   
}

//promise style
fcm.send(message)
    .then(function(response){
        console.log("Successfully sent with response: ", response);
    })
    .catch(function(err){
        console.log("Something has gone wrong!");
        console.error(err);
    })
};

module.exports = {
    sendPush
}
