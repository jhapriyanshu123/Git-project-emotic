require('dotenv').config();

let CONFIG = {}

CONFIG.port                           = process.env.PORT                         || '3000';

CONFIG.db_host                        = process.env.DB_HOST                      || 'localhost';
CONFIG.db_port                        = process.env.DB_PORT                      || '3306';
CONFIG.db_name                        = process.env.DB_NAME                      || 'emotic';
CONFIG.db_user                        = process.env.DB_USER                      || 'debian-sys-maint';
CONFIG.db_password                    = process.env.DB_PASSWORD                  || '62cOCVR28fFLiAFV';

CONFIG.FCM_SERVER_KEY                 = process.env.FCM_SERVER_KEY               || 'AAAA-mN6TBI:APA91bHwcIsjs0r6b_48YLW4cOZagzHZ6h23lJtWWZPjc93yfvhxV7GpqiXDR4jamT7TbeNTvlnmYZn6vKbOAydBfROHP-7n_hM-UO31Y0OKR0ueCf1d2CvRn30F2vGzXy4HOOoe1tN4';
CONFIG.FCM_SENDER_ID                  = process.env.FCM_SENDER_ID                || '1075410783250';

CONFIG.mail_id                        = process.env.MAIL_SENDER_ID               || 'testaativa@gmail.com';
CONFIG.mail_password                  = process.env.MAIL_SENDER_PASSWORD         || 'aativa123';

CONFIG.giphy_api_key                  = process.env.GIPHY_API_KEY                || 'XHlkq9LjnLxYIPsFLhbmKnAxUrx0F0q0';

CONFIG.google_auth_client_id          = process.env.GOOGLE_AUTH_CLIENT_ID        || '828900852468-qta7j5mvufk0csccqrud7ulq56kinh0b.apps.googleusercontent.com';
CONFIG.google_auth_client_secret      = process.env.GOOGLE_AUTH_CLIENT_SECRET    || 'CdrJHswNtPngqV3QQzJz7m6t';

CONFIG.aws_user_bucket_name           = process.env.AWS_BUCKET_NAME              || 'emotic-mood/Users';
CONFIG.aws_post_bucket_name           = process.env.AWS_POST_BUCKET_NAME         || 'emotic-mood/Posts';
CONFIG.aws_post_images_bucket_name    = process.env.AWS_POST_IMAGES              || 'emotic-mood/Images';
CONFIG.aws_post_videos_bucket_name    = process.env.AWS_POST_VIDEOS              || 'emotic-mood/Videos';
CONFIG.aws_post_gif_bucket_name       = process.env.AWS_POST_GIF                 || 'emotic-mood/GIFs';
CONFIG.aws_group_bucket_name          = process.env.AWS_GROUP_BUCKET_NAME        || 'emotic-mood/Groups';
CONFIG.aws_moods_bucket_name          = process.env.AWS_MOODS_BUCKET_NAME        || 'emotic-mood/Moods';


CONFIG.aws_bucket_name                = process.env.AWS_BUCKET_NAME              || 'emotic-mood';
CONFIG.aws_access_key_id              = process.env.AWS_ACCESS_KEY_ID            || 'AKIAI737E6VWIHX66LMQ';
CONFIG.aws_secret_access_key          = process.env.AWS_SECRET_ACCESS_KEY        || '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';
CONFIG.aws_region                     = process.env.AWS_REGION                   || 'eu-west-1';

CONFIG.youtube_api_key                = process.env.YOUTUBE_API_KEY              || 'AIzaSyB7QWpTuRUBR75sFYS-yGZBsn5OVQQzHDk';

module.exports = CONFIG;
