# Microblog (CS4550)

### link to github repo: https://github.com/ChristineTChen/CS4550-hw03.git

### link to deployed app: microblog.christinetchen.com

### Functions
#### LIKES: Users must be logged in to see the Like button (Located in Accounts)
- Likes are visible when viewing a post
- If the current_user has liked a post, they will see the Unlike button.
- Like button should toggle to Unlike if current_user has already liked.
- Unlike will remove users from the list of users who like the post
- Likes are added to the index view of a post, but only appears for the first post

#### POST: Only logged in users can post. 
- Currently, any user can view the post any other user.
- The Post index page (homepage) displays the most recent post on top.
- You can only make posts while logged in.
- You can only edit and delete your own posts.

#### FOLLOW: The follow button only is visible if you've logged in.
- Once you are logged in, you can see a follow button on every user's account card (show).
- If you click follow on a user, you will be brought to a page that asks for confirmation
	- if you click "Follow Me!", it will display to user id of who you've sucessfully followed.
	- if you click back, it will take you back to the place (either Users or User Profile)
- The follow button is hidden if you are not logged in. 
- You cannot follow yourself (no button on your own profile page)
- Currently you cannot unfollow

#### THINGS TO IMPROVE:
- User's profile page should show their posts
