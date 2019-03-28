module.exports = Object.freeze({
     USER_IMAGE_PATH                              : 'http://52.35.47.59:3000/api/v1/img/Users/',
     GROUP_IMAGE_PATH                             : 'http://52.35.47.59:3000/api/v1/img/Groups/',

     REQUIRE_POSTS                                : 1,

     IS_ONLINE                                    : 1,
     IS_OFFLINE                                   : 0,

     POST_BY_ADMIN                                : 1,
     ADMIN_POST_TYPE_QUOTE                        : 1,
     ADMIN_POST_TYPE_VIDEO                        : 2,
     IS_REMOVED_BY_ADMIN                          : 1,

     POST_IMAGE_PATH                              : 'http://52.35.47.59:3000/api/v1/img/Posts_Images/',
     POST_VIDEO_PATH                              : 'http://52.35.47.59:3000/api/v1/img/Posts_Videos/',
     POST_VIDEO_THUMB_PATH                        : 'http://52.35.47.59:3000/api/v1/img/Video_thumbs/',
     POST_GIF_PATH                                : 'http://52.35.47.59:3000/api/v1/img/Posts_GIFs/',

     EMOJI_IMAGE_PATH                             : 'http://52.35.47.59:3000/api/v1/img/Moods/',
     POST_GIF_VID_PATH                            : '/Public/img/add-post/',

     S3_BUCKET_PATH                               : 'https://s3-eu-west-1.amazonaws.com/emotic-mood/',
     S3_USERS                                     : 'Users',
     S3_GROUPS                                    : 'Groups',
     S3_POSTS                                     : 'Posts',
     S3_MOODS                                     : 'Moods',
    
     //sub-folders
     S3_POST_IMAGES                               : 'Posts/Images',
     S3_POST_VIDEOS                               : 'Posts/Videos',
     S3_POST_VIDEOS_THUMB                         : 'Posts/Videos/Thumbs',
     S3_POST_GIF                                  : 'Posts/GIFs',

     IMAGE_POST_FETCH                             : 'Posts_Images',
     VIDEO_POST_FETCH                             : 'Posts_Videos',
     GIF_POST_FETCH                               : 'Posts_GIFs',
     THUMB_POST_FETCH                             : 'Video_thumbs',

     DEFAULT_GROUP_IMAGE                          : 'default.png',
     DEFAULT_USER_IMAGE                           : 'default.png',
     IS_TRASHED                                   : 1,
     IS_BLOCKED                                   : 1,
     IS_OTP_VERIFIED                              : 1,

     IS_POST_DELETED                              : 1,
     IS_POST_REMOVED                              : 1,

     GLOBAL_FEED                                  : 1,
     FRIENDS_FEED                                 : 2,
     MOOD_FEED                                    : 3,

     POST_DATE_FORMAT                             : 'D MMM h:mm a' ,//for home feed

     POST_COMMENTS_REQUIRED                       : 1,

     FOLLOW_REQUEST_SEND                          : 1,
     FOLLOW_REQUEST_ACCEPTED                      : 4,
     FOLLOW_REQUEST_REJECTED                      : 5,   
     FOLLOW_REQUEST_CANCELLED                     : 3,   
     USER_REQUEST_UNFOLLOW                        : 2,    


     FOLLOW_STATUS_FOLLOWING                      : 1,
     FOLLOW_STATUS_NOT_FOLLOWING                  : 2,
     FOLLOW_STATUS_REQUEST_SENT                   : 3,
     FOLLOW_STATUS_REQUEST_RECEIVED               : 4,

     DEFAULT_USER_MOOD                            : 3,

     SEARCH_HOME                                  : 1,
     SEARCH_FOLLOWERS                             : 2,
     SEARCH_FOLLOWING                             : 3,

     //notification types
     NOTIFICATION_NEW_FOLLOW_REQUEST              : 1,
     NOTIFICATION_FOLLOW_REQUEST_ACCEPTED         : 2,
     NOTIFICATION_POST_COMMENT                    : 3,
     NOTIFICATION_POST_LIKE                       : 4,

     NOTIFICATION_POST                            : 1,
     NOTIFICATION_FOLLOW                          : 2,

     NEW_NOTIFICATION                             : 1,
     UPDATE_NOTIFICATION                          : 2,

     //post types
     POST_VIDEO                                   : 2,
     POST_IMAGE                                   : 1,
     POST_GIF                                     : 3,
     POST_YOUTUBE_VIDEO                           : 4,

     GET_FOLLOWERS                                : 1,
     GET_FOLLOWING                                : 2,

     MESSAGE_TYPE_MESSAGE                         : 1,
     MESSAGE_TYPE_IMAGE                           : 2,
     MESSAGE_TYPE_POST                            : 3,

     MESSAGE_DELETED                              : 1,

     MESSAGE_PICTURE_SHARED                       : 'Sent a picture',
     MESSAGE_POST_SHARED                          : 'Shared a post',

     PUSH_MESSAGE_POST_COMMENT                    : ' commented on your post.',
     PUSH_MESSAGE_POST_LIKE                       : ' liked your post.',
     PUSH_MESSAGE_SHARE_POST                      : ' sent you a message',
     PUSH_MESSAGE_SHARE_IMAGE                     : ' sent you a message',
     PUSH_MESSAGE_SEND_MESSAGE                    : ' sent you a message',
     PUSH_MESSAGE_FOLLOW_REQUEST                  : ' has requested to follow you',
     PUSH_MESSAGE_ACCEPT_REQUEST                  : ' has accepted your follow request',

     PUSH_TYPE_FOLLOW_REQUESTS                    : "1",
     PUSH_TYPE_POST                               : "2",
     PUSH_TYPE_CHAT_MESSAGE                       : "3",
     PUSH_TYPE_ADMIN                              : "4"
});
