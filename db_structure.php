<?php

DB STRUCTURE
1. USERS :
   a. id
   b. full_name
   c. username(unique)
   d. password
   d. email
   e. phone_number
   e. country
   f. city
   g. age
   h. image
   i. is_verified (0 by default/1 if user reached 50k followers)
   j. is_trashed(0 by default/1 if admin deletes the user)
   k. is_blocked(0 by default/1 if admin blocks the user)

2. USER_OTP
   a. idea
   b. user_id
   c. otp
   d. flag(set to 0 if otp unused by user else 1) --required if we dont delete otp upon use

3. USER_MOOD :
   a. id
   b. user_id
   c. mood

4. MOOD
   a. id
   b. name
   c. emoji(image)
   d. color

5. USER_POSTS
   a. id
   b. user_id
   c. mood_id
   c. title
   d. description
   e. file(youtube_video_link/image)
   f. is_deleted(0 by default/1 if user deletes the post)
   g. is_removed(0 by default/1 if admin deletes the post)

6. USER_POST_SHARE
   a. id
   b. post_id
   c. user_id (for example : Direct messaging in instagram)
   c. shared_users_id(serialize and then save in db)   --but will have to unserialize every to check for every user if this post should be shown in his feed or not

7. POST_LIKES
   a. id
   b. post_id
   c. user_id

8. POST_COMMENTS
   a. id
   b. post_id
   c. user_id
   d. comment

9. QUOTES(Confused whether to make separate table for quotes or add quotes to post table along with a flag to differentiate between user post and admin quotes)
   a. id
   b. mood_id
   c. image

10. USER_FOLLOW_REQUEST
   a. id
   b. request_user_id
   c. receive_user_id
   d. status (status of request-pending/cancelled/accepted)

11. USER_FOllOWERS
   a. id
   b. follower_id
   c. followed_id
   d. status (blocked or not)

12. USER_BLOCKED
   a. id
   b. user_id
   c. blocked_user_id

13. USER_INVITE(when user invites a user, he also automatically sends a follow request to that user)
   a. id
   b. user_id
   c. name
   d. email
   e. phone_number

14. USER_HIDE_POSTS
   a. id
   b. user_id
   c. post_id

15. USER_CONVERSATION
   a. id
   b. user1_id
   c. user2_id(NULL by default)
   d. group_id(NULL by default)

16. USER_MESSAGES
   a. id
   b. conversation_id
   c. sender_id
   d. message

17. USER_GROUPS
   a. id
   b. admin_id
   c. group_name
   d. group_description
   e. group_logo

18. USER_GROUP_MEMBERS
   a. id
   b. group_id
   c. user_id
   d. is_admin

19. ADMIN_VIDEOS

?>
