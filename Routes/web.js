const express = require('express');
const router = express.Router();

let upload = require('./../Config/multer.config.js');
const auth = require('../Middleware/CheckWebSession');

var adminFunc = require('./../Controller/Admin/AdminController');
var dashboardFunc = require('./../Controller/Admin/DashboardController');
var userFunc = require('./../Controller/Admin/UserController');
var moodFunc = require('./../Controller/Admin/MoodController');
var quotesFunc = require('./../Controller/Admin/QuotesController');
var videoFunc = require('./../Controller/Admin/VideoController');
var postFunc = require('./../Controller/Admin/PostController');
var brodcastFunc = require('./../Controller/Admin/BroadcastController');

router.get('/', (req, res) => {
  res.render('Admin/pages/login', {error : ''});
});

router.get('/login', (req, res) => {
  res.render('Admin/pages/login', {error : ''});
});

router.post('/login',upload.array(), adminFunc.login);

router.get('/logout',upload.array(), adminFunc.logout);

router.get('/dashboard', [upload.array(),auth.webAuth] , dashboardFunc.showDashboard);

router.get('/change-password', [upload.array(),auth.webAuth] , adminFunc.showChangePassword);

router.post('/change-password', [upload.array(),auth.webAuth] , adminFunc.changePassword);

//users
router.get('/users', [upload.array(),auth.webAuth], userFunc.getUsers);

router.get('/view-user', [upload.array(),auth.webAuth], userFunc.viewUser);

router.get('/add-user', [upload.array(),auth.webAuth], userFunc.showAddUser);

router.post('/add-user', [upload.single('image'),auth.webAuth], userFunc.addUser);

router.post('/block-user', [upload.array(),auth.webAuth], userFunc.blockUser);

router.post('/verify-user', [upload.array(),auth.webAuth], userFunc.verifyUser);

router.get('/delete-user', [upload.array(),auth.webAuth], userFunc.removeUser);

//posts
router.get('/posts', [upload.array(),auth.webAuth], postFunc.getPosts);

router.get('/view-post', [upload.array(),auth.webAuth], postFunc.viewPost);

router.get('/remove-post', [upload.array(),auth.webAuth], postFunc.removePost);

//moods
router.get('/moods', [upload.array(),auth.webAuth], moodFunc.getMoods);

router.get('/edit-mood', [upload.array(),auth.webAuth], moodFunc.showEditMood);

router.post('/edit-mood', [upload.single('image'),auth.webAuth], moodFunc.updateMood);

router.get('/add-mood', [upload.array(),auth.webAuth], moodFunc.showAddMood);

router.post('/add-mood', [upload.single('image'),auth.webAuth], moodFunc.addMood);

router.get('/delete-mood', [upload.array(),auth.webAuth], moodFunc.deleteMood);

//quotes
router.get('/quotes', [upload.array(),auth.webAuth], quotesFunc.getQuotes);

router.get('/edit-quote', [upload.array(),auth.webAuth], quotesFunc.showEditQuote);

router.post('/edit-quote', [upload.single('image'),auth.webAuth], quotesFunc.updateQuote);

router.get('/add-quote', [upload.array(),auth.webAuth], quotesFunc.showAddQuotes);

router.post('/add-quote', [upload.single('image'),auth.webAuth], quotesFunc.addQuotes);

router.get('/delete-quote', [upload.array(),auth.webAuth], quotesFunc.deleteQuote);

//videos
router.get('/videos', [upload.array(),auth.webAuth], videoFunc.getVideos);

router.get('/edit-video', [upload.array(),auth.webAuth], videoFunc.showEditVideo);

router.post('/edit-video', [upload.fields([{name: 'thumb', maxCount: 1}, {name: 'image', maxCount: 1}]), auth.webAuth], videoFunc.updateVideo);

router.get('/add-video', [upload.array(),auth.webAuth], videoFunc.showAddVideos);

router.post('/add-video', [upload.fields([{name: 'thumb', maxCount: 1}, {name: 'image', maxCount: 1}]), auth.webAuth], videoFunc.addVideos);

router.get('/delete-video', [upload.array(),auth.webAuth], videoFunc.deleteVideo);

//broadcast
router.get('/broadcast', [upload.array(),auth.webAuth], brodcastFunc.showBroadcastPage);

router.post('/notify-users', [upload.array(),auth.webAuth], brodcastFunc.broadcast);


//for app
router.get('/terms-and-conditions' , (req, res) => {
  res.render('Api/Pages/TermsConditions');
});

router.get('/privacy-policy' , (req, res) => {
  res.render('Api/Pages/PrivacyPolicy');
});

router.get('/contact-us' , (req, res) => {
  res.render('Api/Pages/ContactUs');
});

module.exports = router;