const collection = require('./../../Database/Collections');
const moment = require('moment');

const constants = require('./../../Library/Constants');
const timeFunc = require('./../../Library/TimeFunctions');
const postMySql = require('./../../Library/CommonQueries/Posts');
const requestErrors = require('./../../Library/Helpers/FetchErrors');

var getPosts = async(req, res) => {
  try{
    //pagination
  var resultCount = generatePagination(req.query.page);

  var date = req.query.date_filter ? moment(req.query.date_filter).format('YYYY-MM-DD') : '';
  if(req.query.post_search || req.query.date_filter || req.query.user_filter){
  	var search = req.query.post_search;
    search = search.replace(/^\s+/g, '');
  	var searchParam = '%'+search+'%';
    var dateFilterOperator = date ? 'like' : '!=';
    var dateParam = '%'+date+'%';
    var userFilter = req.query.user_filter
    var userFilterOperator = userFilter ?  '=' : '!=';

  	var posts = await collection.UserPosts.query(qb => {
                 qb.where(qb => {
                    qb.where('title','like',searchParam);
                    qb.orWhere('description','like',searchParam);
                    qb.orWhere('youtube_video_title','like',searchParam);
                    qb.orWhere('youtube_video_description','like',searchParam);
                 });
                 qb.where('user_id',userFilterOperator, req.query.user_filter);
                 qb.where('created_at',dateFilterOperator,dateParam);
                 qb.whereNotNull('user_id');
                 qb.where('user_posts.is_by_admin','!=',constants.POST_BY_ADMIN);
                 qb.where('user_posts.is_removed','!=',constants.IS_POST_REMOVED);
                 qb.offset(resultCount.skip);
                 qb.limit(resultCount.limit);
                 qb.orderBy('id','DESC');
            	}).fetch();
    var paginationPosts = await getTotalPosts(1,searchParam,userFilterOperator,req.query.user_filter,dateFilterOperator,dateParam);
    var totalPages = await getPagelinks(paginationPosts);
  } else {
  	var search = '';
    var userFilter = '';
    var date = '';
  	var posts = await collection.UserPosts.query(qb => {
                 qb.where('user_posts.is_by_admin','!=',constants.POST_BY_ADMIN);
                 qb.where('is_removed','!=',constants.IS_POST_REMOVED);
                 qb.orderBy('id','DESC');
                 qb.offset(resultCount.skip);
                 qb.limit(resultCount.limit);
            	}).fetch();  	
    var paginationPosts = await getTotalPosts(2);
    var totalPages = await getPagelinks(paginationPosts); 
  }
  if(userFilterOperator === '!='){
    userFilter = '';
  }
  if(dateFilterOperator === 'like'){
    date = req.query.date_filter;
  }
  var users = await collection.Users.query(qb => {
                qb.orderBy('full_name','ASC');
                qb.where('is_trashed','!=',constants.IS_TRASHED);
              }).fetch();
  var moods = await getMoods();
  res.render('Admin/pages/posts',{posts : posts , post_search : search , users : users, user_filter : userFilter , date_filter : date , moods : moods,
                                  fetchMood : fetchMood, dateFormat : timeFunc.postDate, postCount : posts.length, pages : totalPages, page : req.query.page,
                                  url : req.url});
} catch (e) {
  console.log(e);
}
};

var getTotalPosts = async(type,searchParam=null,userFilterOperator=null,userFilter=null,dateFilterOperator=null,dateParam) => {
  if(type==1){
    var posts = await collection.UserPosts.query(qb => {
                   qb.where(qb => {
                      qb.where('title','like',searchParam);
                      qb.orWhere('description','like',searchParam);
                      qb.orWhere('youtube_video_title','like',searchParam);
                      qb.orWhere('youtube_video_description','like',searchParam);
                   });
                   qb.where('user_id',userFilterOperator, userFilter);
                   qb.where('created_at',dateFilterOperator,dateParam);
                   qb.whereNotNull('user_id');
                   qb.where('user_posts.is_by_admin','!=',constants.POST_BY_ADMIN);
                   qb.where('user_posts.is_removed','!=',constants.IS_POST_REMOVED);
                   qb.orderBy('id','DESC');
                }).count();
   } else {
    var posts = await collection.UserPosts.query(qb => {
                   qb.where('user_posts.is_by_admin','!=',constants.POST_BY_ADMIN);
                   qb.where('is_removed','!=',constants.IS_POST_REMOVED);
                   qb.orderBy('id','DESC');
                }).count();   

   } 
  return posts;
};

var viewPost = async(req, res) => {
  try{
 var post = await collection.UserPostsModel.query(qb => {
               qb.leftJoin('users','user_posts.user_id','users.id');
               qb.leftJoin('user_mood','user_mood.user_id','users.id');
               qb.where('user_posts.is_by_admin','!=',constants.POST_BY_ADMIN);
               qb.where('user_posts.is_removed','!=',constants.IS_POST_REMOVED);
               qb.where('user_posts.id',req.query.post_id);
               qb.orderBy('user_posts.id','DESC');
             }).fetch({columns : ['user_posts.id', 'user_posts.title' , 'user_posts.description' , 'user_posts.media' , 'user_posts.is_by_admin','user_posts.created_at','users.full_name','users.phone_number',
                                  'users.username' ,'users.image' , 'user_posts.timezone','user_posts.mood_id','user_posts.type','users.id as user_id','user_posts.youtube_video_title','users.email',
                                  'user_posts.youtube_video_description','user_posts.youtube_video_id','user_posts.youtube_video_thumb','user_posts.video_thumb','user_posts.gif_image_url']});
 

  var numComments = await postMySql.getTotalComments(req.query.post_id);
  var numLikes = await postMySql.getTotallikes(req.query.post_id);
  var numViews = await postMySql.getTotalViews(req.query.post_id);
  var numShares = await postMySql.getTotalShares(req.query.post_id);
  var numReports = await postMySql.getTotalReports(req.query.post_id);
  var moods = await getMoods();
  res.render('Admin/pages/post_details',{post : post , fetchMood : fetchMood , moods : moods, dateFormat : timeFunc.postDate, likes : numLikes , comments : numComments,
                                         views : numViews, shares : numShares, reports : numReports, url : req.url});
} catch (e) {
  console.log(e);
}
};

var removePost = async(req, res) => {
  var trashPost = await collection.UserPostsModel.query(qb => {
                   qb.where('id',req.query.post_id);
                  }).save({is_removed : constants.IS_POST_REMOVED}, {patch : true});
  res.redirect('posts');
};


var getMoods = async() => {
  var moods = await collection.Moods.query(qb => {
                qb.orderBy('id','ASC');
              }).fetch();
  return moods;
}

var fetchMood = (moodId, moods) => {
  try{
  var postMoods = JSON.parse(moodId);

  var moodStr = '';
  for(var i = 0 ; i < moods.length; i++){
      if(postMoods.includes(moods.models[i].attributes.id)){
        moodStr += moods.models[i].attributes.name + ',';
      }
  }
  return moodStr;
} catch (e) {
  console.log(e);
}
};

var getPagelinks = (count) => {
  var pages = count/15;
  return Math.ceil(pages);
};

var generatePagination = (page) => {
  var limit = 15;
  var skip = page ? (page-1) * limit : 0;
  var pagesVar = {};
  pagesVar.limit = limit;
  pagesVar.skip = skip;
  return pagesVar;
};

module.exports = {
	getPosts,
	viewPost,
	removePost,
  fetchMood,
  getPagelinks
}