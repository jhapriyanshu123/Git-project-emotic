const http = require('http');
const express = require('express');
const socketIO = require('socket.io');
const engine = require('ejs-locals');
const bodyParser = require('body-parser');
const validator = require('express-validator');
const processImage = require('express-processimage');
const partials = require('express-partials');
const session = require('express-session');
const randomString = require('randomstring');

const CONFIG = require('./Config/config');
const apiRoutes = require('./Routes/api');
const webRoutes = require('./Routes/web');
const socketMessageFunc = require('./Socket/MessageFunctions');
const errorHandler = require('./Library/ErrorHandler');

const app = express();
const server = http.createServer(app);
const io = socketIO(server);

var sessionId = randomString.generate(12);

app.engine('ejs',engine);
app.set('view engine','ejs');

var middleware = [
express.static('Public/'),
bodyParser.urlencoded({
  extended : false
}),
bodyParser.json(),
validator(),
processImage(),
partials(),
session({secret: sessionId, 
         resave: true,
         saveUninitialized: true})
];

app.use(middleware);
app.use('/api/v1',apiRoutes);
app.use('/',webRoutes);
app.use(errorHandler);
app.io = io;

io.on('connection' , async (socket) => {
  console.log('connected');

  socket.on('joinConversation' , async(data) => {
    var room = data.conversation_id;
    await socketMessageFunc.updateUserStatus(data,1,socket.id); //mark user as online and save socket id
    console.log("conversation joined by = " + socket.id);
  });

  socket.on('sendMessage' , async(data) => {
    var socketId = socket.id;
    var room = data.conversation_id;
    var response = await socketMessageFunc.sendMessage(data,socketId);
    var socketIds = response.socketId;
    var numClients = 0;
    
    if(socketIds.length >= 1){
      var updateReadCount = await socketMessageFunc.updateReadStatus(data);
    }

     for(var i = 0 ; i < socketIds.length ; i++){
        io.to(socketIds[i]).emit('receiveMessage', response.message);
     } 

    
    //socket.broadcast.to(room).emit('receiveMessage', response.message);
  });

  socket.on('leaveConversation' , async(data) => {
    await socketMessageFunc.updateUserStatus(data,0); //mark user as offline
    console.log("conversation left by = " + socket.id);
  });

  socket.on('disconnect', function(){
        console.log('disconnected');
  });

});

server.listen(CONFIG.port , () => {
  console.log('Listening on port 3000');
})

