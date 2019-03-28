const collection = require('./../../Database/Collections');
const constants = require('./../../Library/Constants');

var showDashboard = async (req, res) => {
  try{
  var totalUsers = await collection.Users.query(qb => {
                     qb.where('is_trashed','!=',constants.IS_TRASHED);
                   }).count();
  var moods = await collection.Moods.query(qb => {
                     qb.orderBy('id','DESC');
                   }).count();
  var posts = await collection.UserPosts.query(qb => {
                     qb.where('is_removed','!=',constants.IS_POST_REMOVED);
                   }).count();
  console.log(req.url);
  res.render('Admin/pages/dashboard', {total_users : totalUsers, total_moods : moods, total_posts : posts, url : req.url});
} catch (e) {
	console.log(e);
}
};

module.exports = {
	showDashboard
}