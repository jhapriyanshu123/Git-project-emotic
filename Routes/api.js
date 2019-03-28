const express = require('express');
const router = express.Router();

// const upload = require('./../Library/Helpers/FileUpload');
let upload = require('./../Config/multer.config.js');

const getImage = require('./../Library/Helpers/FetchImage');

const auth = require('../Middleware/CheckAppSession');

const userFunc = require('./../Controller/Api/UserController');
const loginFunc = require('./../Controller/Api/LoginController');
const moodFunc = require('./../Controller/Api/MoodController');
const mediaFunc = require('./../Controller/Api/MediaController');
const homeFunc = require('./../Controller/Api/HomeController');
const postFunc = require('./../Controller/Api/PostController');
const chatFunc = require('./../Controller/Api/ChatController');
const groupFunc = require('./../Controller/Api/GroupController');
const searchFunc = require('./../Controller/Api/SearchController');
const followFunc = require('./../Controller/Api/FollowersController');
const notificationFunc = require('./../Controller/Api/NotificationController');

router.get('/' , (req, res) => {
  res.render('Api/api');
});

//UserFunctions
router.post('/login' , upload.array() , (req, res, next) => {
    loginFunc.login(req, res).then((user) => {
      res.status(200).json(user);
    }).catch(next);
});

router.post('/social-login' , upload.array() , (req, res, next) => {
    loginFunc.socialLogin(req, res).then((user) => {
      res.status(200).json(user);
    }).catch(next);
});

router.post('/signup' , upload.single('image') , (req, res, next) => {
    userFunc.signup(req, res).then((user) => {
      res.status(200).json(user);
    }).catch(next);
});

router.post('/send-otp' , upload.array() , (req, res, next) => {
    userFunc.sendOtp(req, res).then((user) => {
      res.status(200).json(user);
    }).catch(next);
});

router.post('/verify-otp' , upload.array() , (req, res, next) => {
    userFunc.verifyOtp(req, res).then((user) => {
      res.status(200).json(user);
    }).catch(next);
});

router.post('/edit-profile' , [upload.single('image'), auth.appAuth] , (req, res, next) => {
    userFunc.editProfile(req, res).then((user) => {
      res.status(200).json(user);
    }).catch(next);
});

router.get('/get-user-profile' , [upload.array(), auth.appAuth] , (req, res, next) => {
    userFunc.getUserProfile(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/change-password' , [upload.array(), auth.appAuth] , (req, res, next) => {
    userFunc.changePassword(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/forgot-password' , upload.array() , (req, res, next) => {
    userFunc.forgotPassword(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.get('/reset-password/:token' , upload.array() , async(req, res, next) => {
  userFunc.showResetPassword(req, res).then((output) => {
    res.status(200).json(output);
  }).catch(next);
});

router.post('/reset-password' , upload.array() , async(req, res, next) => {
  userFunc.resetPassword(req, res).then((output) => {
    res.status(200).json(output);
  }).catch(next);
});

router.post('/block-user' , [upload.array(), auth.appAuth] , (req, res, next) => {
    userFunc.blockUser(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.get('/get-blocked-user' , [upload.array(), auth.appAuth] , (req, res, next) => {
    userFunc.getBlockedUser(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/logout' , [upload.array(), auth.appAuth] , (req, res, next) => {
    userFunc.logout(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});


//Mood functions
router.post('/update-mood' , [upload.array(), auth.appAuth] , (req, res, next) => {
    moodFunc.updateMood(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.get('/get-moods' , upload.array() , (req, res, next) => {
    moodFunc.getMoods(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});


//Home functions
router.get('/get-feed' , [upload.array(), auth.appAuth] , (req, res, next) => {
    homeFunc.getFeed(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.get('/get-posts' , [upload.array(), auth.appAuth] , (req, res, next) => {
    searchFunc.getPosts(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});


//Media functions
router.get('/get-gifs' , [upload.array()] , (req, res, next) => {
    mediaFunc.getGifs(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.get('/get-youtube-videos' , [upload.array()] , (req, res, next) => {
    mediaFunc.getYoutubeVideos(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});


//Post functions
router.post('/add-post' , [ upload.fields([{name: 'media', maxCount: 1}, {name: 'video_thumb', maxCount: 1}]), auth.appAuth] , (req, res, next) => {
    postFunc.addPost(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/comment-on-post' , [upload.array(), auth.appAuth] , (req, res, next) => {
    postFunc.commentOnPost(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/like-post' , [upload.array(), auth.appAuth] , (req, res, next) => {
    postFunc.likePost(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/view-video' , [upload.array(), auth.appAuth] , (req, res, next) => {
    postFunc.addView(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.get('/get-post-likes' , [upload.array(), auth.appAuth] , (req, res, next) => {
    postFunc.getPostLikes(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.get('/get-post-comments' , [upload.array(), auth.appAuth] , (req, res, next) => {
    postFunc.getPostComments(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.get('/get-post' , [upload.array(), auth.appAuth] , (req, res, next) => {
    postFunc.getPost(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/share-post' , [upload.single('group_logo'), auth.appAuth] , (req, res, next) => {
    postFunc.sharePost(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/hide-post' , [upload.array(), auth.appAuth] , (req, res, next) => {
    postFunc.hidePost(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/report-post' , [upload.array(), auth.appAuth] , (req, res, next) => {
    postFunc.reportPost(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/delete-post' , [upload.array(), auth.appAuth] , (req, res, next) => {
    postFunc.deletePost(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});


//Search functions
router.get('/search-users' , [upload.array(), auth.appAuth] , (req, res, next) => {
    searchFunc.searchUser(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});


//Followers functions
router.post('/send-follow-request' , [upload.array(), auth.appAuth] , (req, res, next) => {
    followFunc.sendFollowRequest(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

// router.post('/update-request-status' , [upload.array(), auth.appAuth] , (req, res, next) => {
//     followFunc.updateRequestStatus(req, res).then((output) => {
//       res.status(200).json(output);
//     }).catch(next);
// });

router.get('/get-followers' , [upload.array(), auth.appAuth] , (req, res, next) => {
    followFunc.getFollowers(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.get('/get-following' , [upload.array(), auth.appAuth] , (req, res, next) => {
    followFunc.getFollowing(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});


//Chat functions
router.post('/initialize-conversation' , [upload.array(), auth.appAuth] , (req, res, next) => {
    chatFunc.initializeConversation(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.get('/conversation-listing' , [upload.array(), auth.appAuth] , (req, res, next) => {
    chatFunc.getConversationListing(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.get('/get-conversation-messages' , [upload.array(), auth.appAuth] , (req, res, next) => {
    chatFunc.getConversationMessages(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/upload-chat-image' , [upload.single('image'), auth.appAuth] , (req, res, next) => {
    chatFunc.uploadChatImage(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.get('/get-group' , [upload.array(), auth.appAuth] , (req, res, next) => {
    groupFunc.getGroup(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/create-group' , [upload.single('image'), auth.appAuth] , (req, res, next) => {
    groupFunc.createGroup(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/update-group-members' , [upload.array(), auth.appAuth] , (req, res, next) => {
    groupFunc.updateGroupMembers(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/leave-group' , [upload.array(), auth.appAuth] , (req, res, next) => {
    groupFunc.leaveGroup(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/group-notification-status' , [upload.array(), auth.appAuth] , (req, res, next) => {
    groupFunc.updateGroupNotificationStatus(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/mute-conversation' , [upload.array(), auth.appAuth] , (req, res, next) => {
    chatFunc.muteConversation(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.post('/clear-chat' , [upload.array(), auth.appAuth] , (req, res, next) => {
    chatFunc.clearChat(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});


//Notification functions
router.get('/fetch-follow-request' , [upload.array(), auth.appAuth] , (req, res, next) => {
    notificationFunc.fetchFollowRequest(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});

router.get('/get-notifications' , [upload.array(), auth.appAuth] , (req, res, next) => {
    notificationFunc.getNotifications(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});


//Group functions
router.post('/create-group' , [upload.single('logo'), auth.appAuth] , (req, res, next) => {
    groupFunc.createGroup(req, res).then((output) => {
      res.status(200).json(output);
    }).catch(next);
});


router.get('/img/:folder/:image/:w?/:h?',getImage.imageProcess);

module.exports = router;
