# Microblog (CS4550 hw03, hw04, hw05)

### link to github repo: https://github.com/ChristineTChen/CS4550-hw03.git

### link to deployed app: microblog.christinetchen.com
	to see the messages/posts: microblog.christinetchen.com/

### HW 05

#### LIKES: Users must be logged in to see the Like button (Located in Accounts)
- Likes are visible when viewing a post
- If the current_user has liked a post, they will see the Unlike button.
- Like button should toggle to Unlike if current_user has already liked.
- Unlike will remove users from the list of users who like the post
- Likes are added to the index view of a post, but only appears for the first post


#### Deploy Script
Attribution: Professor Nat Tuck's deploy script for numart code was used for this deploy script with some changes.
- Deploy script is called deploy.sh located in the root directory of my repo.
- Deploy.sh is a bash script that can be run from command line/terminal
- I wrote my deploy.sh script to be run on the server, so you must clone the project repo and pull & update.
- TO RUN DEPLOY SCRIPT, <path> is where the project path. If you've cloned my repo, it should be CS4550-hw03/microblog
  $ ./deploy <path>




### HW 04

When user visits Microblog, they will see the post feed page (post index).

#### LOGIN/LOGOUT: If no user is logged in, they will only see Posts & New Users 
& Email Login tabs on the navigation bar.
They also do not have the ability to write new posts.

	EXISTING USER:  
	The user must log in with a valid email that exists in the database.
		- Once they are logged in, the user will see button to make
			New Post.
		- They will see their username with a logout option
		- They will see a My Profile tab in navigation and can view their profile 
   
	NEW USER:
	If their email is not registered, they can create a new User by clicking the New User tab. 
		- User will complete New User form.
		- User will need to log in with their newly registered email
		- User will see & experience the same as the EXISTING USER.

#### POST: Only logged in users can post. The post will display the USER ID of the poster.
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
