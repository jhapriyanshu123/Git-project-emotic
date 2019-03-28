var bookShelf = require('./connect.js');

//Models
var AdminModel = bookShelf.Model.extend({
  tableName : 'admin',
  hasTimestamps : true
});

var PostViewsModel = bookShelf.Model.extend({
  tableName : 'post_views',
  hasTimestamps : true
});

var AdminQuotesModel = bookShelf.Model.extend({
  tableName : 'admin_quotes',
  hasTimestamps : true
});

var UserReportPostModel = bookShelf.Model.extend({
  tableName : 'user_report_post',
  hasTimestamps : true
});

var PostMoodModel = bookShelf.Model.extend({
  tableName : 'post_mood',
  hasTimestamps : true
});

var AppLoginModel = bookShelf.Model.extend({
  tableName : 'app_login',
  hasTimestamps : true
});

var MoodsModel = bookShelf.Model.extend({
  tableName : 'moods',
  hasTimestamps : true
});

var PostCommentsModel = bookShelf.Model.extend({
  tableName : 'post_comments',
  hasTimestamps : true
});

var PostLikesModel = bookShelf.Model.extend({
  tableName : 'post_likes',
  hasTimestamps : true
});

var UsersModel = bookShelf.Model.extend({
  tableName : 'users',
  hasTimestamps : true
});

var TempUserModel = bookShelf.Model.extend({
  tableName : 'tmp_user',
  hasTimestamps : true
});

var UserBlockedModel = bookShelf.Model.extend({
  tableName : 'user_blocked',
  hasTimestamps : true
});

var UserConversationModel = bookShelf.Model.extend({
  tableName : 'user_conversation',
  hasTimestamps : true
});

var UserFollowersModel = bookShelf.Model.extend({
  tableName : 'user_followers',
  hasTimestamps : true
});

var UserFollowRequestsModel = bookShelf.Model.extend({
  tableName : 'user_follow_requests',
  hasTimestamps : true
});

var UserGroupsModel = bookShelf.Model.extend({
  tableName : 'user_groups',
  hasTimestamps : true
});

var UserGroupMembersModel = bookShelf.Model.extend({
  tableName : 'user_group_members',
  hasTimestamps : true
});

var UserHidePostsModel = bookShelf.Model.extend({
  tableName : 'user_hide_posts',
  hasTimestamps : true
});

var UserInviteModel = bookShelf.Model.extend({
  tableName : 'user_invite',
  hasTimestamps : true
});

var UserMessagesModel = bookShelf.Model.extend({
  tableName : 'user_messages',
  hasTimestamps : true
});

var UserMoodModel = bookShelf.Model.extend({
  tableName : 'user_mood',
  hasTimestamps : true
});

var UserOtpModel = bookShelf.Model.extend({
  tableName : 'user_otp',
  hasTimestamps : true
});

var UserPostsModel = bookShelf.Model.extend({
  tableName : 'user_posts',
  hasTimestamps : true
});

var UserPostShareModel = bookShelf.Model.extend({
  tableName : 'user_post_share',
  hasTimestamps : true
});

var UserNotificationModel = bookShelf.Model.extend({
  tableName : 'user_notification',
  hasTimestamps : true
});

var TokensModel = bookShelf.Model.extend({
  tableName : 'tokens',
  hasTimestamps : true
});

var UserMutedConversationsModel = bookShelf.Model.extend({
  tableName : 'user_muted_conversations',
  hasTimestamps : true
});

var UserSocketModel = bookShelf.Model.extend({
  tableName : 'user_socket',
  hasTimestamps : true
});

//collections
var Admin = bookShelf.Collection.extend({
  model : AdminModel
});

var PostViews = bookShelf.Collection.extend({
  model : PostViewsModel
});

var AdminQuotes = bookShelf.Collection.extend({
  model : AdminQuotesModel
});

var UserReportPost = bookShelf.Collection.extend({
  model : UserReportPostModel
});

var PostMood = bookShelf.Collection.extend({
  model : PostMoodModel
});

var AppLogin = bookShelf.Collection.extend({
  model : AppLoginModel
});

var Moods = bookShelf.Collection.extend({
  model : MoodsModel
});

var PostComments = bookShelf.Collection.extend({
  model : PostCommentsModel
});

var PostLikes = bookShelf.Collection.extend({
  model : PostLikesModel
});

var Users = bookShelf.Collection.extend({
  model : UsersModel
});

var TempUser = bookShelf.Collection.extend({
  model : TempUserModel
});

var UserBlocked = bookShelf.Collection.extend({
  model : UserBlockedModel
});

var UserConversation = bookShelf.Collection.extend({
  model : UserConversationModel
});

var UserFollowers = bookShelf.Collection.extend({
  model : UserFollowersModel
});

var UserFollowRequests = bookShelf.Collection.extend({
  model : UserFollowRequestsModel
});

var UserGroups = bookShelf.Collection.extend({
  model : UserGroupsModel
});

var UserGroupMembers = bookShelf.Collection.extend({
  model : UserGroupMembersModel
});

var UserHidePosts = bookShelf.Collection.extend({
  model : UserHidePostsModel
});

var UserInvite = bookShelf.Collection.extend({
  model : UserInviteModel
});

var UserMessages = bookShelf.Collection.extend({
  model : UserMessagesModel
});

var UserMood = bookShelf.Collection.extend({
  model : UserMoodModel
});

var UserOtp = bookShelf.Collection.extend({
  model : UserOtpModel
});

var UserPosts = bookShelf.Collection.extend({
  model : UserPostsModel
});

var UserPostShare = bookShelf.Collection.extend({
  model : UserPostShareModel
});

var UserNotification = bookShelf.Collection.extend({
  model : UserNotificationModel
});

var Tokens = bookShelf.Collection.extend({
  model : TokensModel
});

var UserMutedConversations = bookShelf.Collection.extend({
  model : UserMutedConversationsModel
});

var UserSocket = bookShelf.Collection.extend({
  model : UserSocketModel
});

module.exports = {
  Admin,
  AdminModel,
  AdminQuotes,
  AdminQuotesModel,
  AppLogin,
  AppLoginModel,
  Moods,
  MoodsModel,
  PostComments,
  PostCommentsModel,
  PostLikes,
  PostLikesModel,
  Users,
  UsersModel,
  UserBlocked,
  UserBlockedModel,
  UserConversation,
  UserConversationModel,
  UserFollowers,
  UserFollowersModel,
  UserFollowRequests,
  UserFollowRequestsModel,
  UserGroups,
  UserGroupsModel,
  UserGroupMembers,
  UserGroupMembersModel,
  UserHidePosts,
  UserHidePostsModel,
  UserInvite,
  UserInviteModel,
  UserMessages,
  UserMessagesModel,
  UserMood,
  UserMoodModel,
  UserOtp,
  UserOtpModel,
  UserPosts,
  UserPostsModel,
  UserPostShare,
  UserPostsModel,
  UserNotification,
  UserNotificationModel,
  Tokens,
  TokensModel,
  TempUser,
  TempUserModel,
  PostMoodModel,
  PostMood,
  UserMutedConversations,
  UserMutedConversationsModel,
  UserSocket,
  UserSocketModel,
  PostViewsModel,
  PostViews,
  UserPostShareModel,
  UserPostShare,
  UserReportPostModel,
  UserReportPost
}
