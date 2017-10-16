// Attribution hexdocs.pm/phoenix/channels.html

// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "assets/js/app.js".

// To use Phoenix channels, the first step is to import Socket
// and connect at the socket path in "lib/web/endpoint.ex":
import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

// When you connect, you'll often need to authenticate the client.
// For example, imagine you have an authentication plug, `MyAuth`,
// which authenticates the session and assigns a `:current_user`.
// If the current user exists you can assign the user's token in
// the connection for use in the layout.
//
// In your "lib/web/router.ex":
//
//     pipeline :browser do
//       ...
//       plug MyAuth
//       plug :put_user_token
//     end
//
//     defp put_user_token(conn, _) do
//       if current_user = conn.assigns[:current_user] do
//         token = Phoenix.Token.sign(conn, "user socket", current_user.id)
//         assign(conn, :user_token, token)
//       else
//         conn
//       end
//     end
//
// Now you need to pass this token to JavaScript. You can do so
// inside a script tag in "lib/web/templates/layout/app.html.eex":
//
//     <script>window.userToken = "<%= assigns[:user_token] %>";</script>
//
// You will need to verify the user token in the "connect/2" function
// in "lib/web/channels/user_socket.ex":
//
//     def connect(%{"token" => token}, socket) do
//       # max_age: 1209600 is equivalent to two weeks in seconds
//       case Phoenix.Token.verify(socket, "user socket", token, max_age: 1209600) do
//         {:ok, user_id} ->
//           {:ok, assign(socket, :user, user_id)}
//         {:error, reason} ->
//           :error
//       end
//     end
//
// Finally, pass the token on connect as below. Or remove it
// from connect if you don't care about authentication.

socket.connect()
// Now that you are connected, you update feeds page in realtime:
let channel = socket.channel("updates:lobby", {})


var post_path = location.pathname.startsWith("/posts")
var new_post = location.hash == "#newPost"
let post_entries= $("#post-entries")

function resetHash() {
	window.location.hash ='';
}

let postId
let title
let content
let user

function onLoad() {
	if (post_path && new_post) {
		postId = post_id
		title = post_title
		content = post_content
		user = post_user
		channel.push("new_msg", {id: postId, user_id: 
			user, title: title, content: content });
		resetHash();
	}

}

channel.on("new_msg", payload => {
	let update_post = `  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-block">
            <div class="well well-lg">
              <div class="card-body">
                <h3 class="card-title">${payload.title}</h3>
              	  <p class="card-text">
                	${payload.content}
              	  </p>
           	  </div>
              <div class="card-footer text-muted">
             	<p> Posted just now by ${payload.user_id} </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>`

  post_entries.prepend(update_post)
})

$(onLoad)

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

//channel.on("new_msg", liveFeedUpdate);
export default socket;
