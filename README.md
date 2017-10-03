# Microblog (CS4550 hw03, hw04)

###link to github repo: https://github.com/ChristineTChen/CS4550-hw03.git

###link to deployed app: microblog.christinetchen.com
	to see the messages/posts: microblog.christinetchen.com/

###HW 04

When user visits Microblog, they will see the post feed page (post index).

####LOGIN/LOGOUT: If no user is logged in, they will only see Posts & New Users 
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

####POST: Only logged in users can post. The post will display the USER ID of the poster.
- I could not figure out how to show the user's name from its post schema foreign key.
- Currently, any user can view the post any other user.

####FOLLOW: The follow button only is visible if you've logged in.
- Once you are logged in, you can see a follow button on every user's account card (index or show).
- If you click follow on a user, you will be brought to a page that asks for confirmation
	- if you click "Yes!", it will simulate a successful follow (flaw: however, it isn't being added to the database
	correctly because I couldn't figure out how to pass the correct user id that is being followed by current_user)
	- if you click back, it will take you back to the place (either Users or User Profile)
- The follow button is hidden if you are not logged in. 

####THINGS TO IMPROVE:
- User's profile page should show their posts
- Posts should display the author's username instead of ID
- Follow form should be able to identify the user being followed (Could not figure out how to pass that in )
- On User Profile, Following & Followers tabs should bring you to list of correct query
