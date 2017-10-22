defmodule MicroblogWeb.PageController do
  use MicroblogWeb, :controller

  def index(conn, _params) do
 #  		<%= if !@current_user do %>
	#   <li class="nav-item">
 #             <%= link "New User", to: user_path(@conn, :new), class: "nav-link" %>
 #          </li>
	# <% end %>
    redirect conn,  to: user_path(@conn, :new)
  end
end
