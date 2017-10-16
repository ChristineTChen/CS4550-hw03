defmodule MicroblogWeb.PostControllerTest do
  use MicroblogWeb.ConnCase

  alias Microblog.Blog

  @create_attrs %{content: "some content", title: "some title"}
  @update_attrs %{content: "some updated content", title: "some updated title"}
  @invalid_attrs %{content: nil, title: nil}

  def fixture(:post) do
    {:ok, post} = Blog.create_post(@create_attrs)
    post
  end

  describe "index" do
    test "lists all posts", %{conn: conn} do
      conn = get conn, post_path(conn, :index)
      assert "<!DOCTYPE html>\n<html lang=\"en\">\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <meta name=\"description\" content=\"\">\n    <meta name=\"author\" content=\"\">\n\n    <title>Hello Microblog!</title>\n    <link rel=\"stylesheet\" href=\"/css/app.css\">\n  </head>\n\n\n  <body>\n\n   <!-- Attribution: Nav bar from lecture code-->\n   <nav class=\"navbar navbar-dark bg-dark navbar-expand-md\">\n      <a class=\"navbar-brand\" href=\"/posts\">Microblog</a>\n\n      <button class=\"navbar-toggler\" type=\"button\"\n              data-toggle=\"collapse\" data-target=\"#main-navbar\">\n        <span class=\"navbar-toggler-icon\"></span>\n      </button>\n\n      <div class=\"collapse navbar-collapse\" id=\"main-navbar\">\n        <ul class=\"navbar-nav mr-auto\">\n          <li class=\"nav-item\">\n<a class=\"nav-link\" href=\"/posts\">Posts</a>\t  </li>\n\t  <li class=\"nav-item\">\n<a class=\"nav-link\" href=\"/users\">Users</a>\t  </li>\n\t  <li class=\"nav-item\">\n<a class=\"nav-link\" href=\"/users/new\">New User</a>          </li>\n        </ul>\n      </div>\n\n        <form accept-charset=\"UTF-8\" action=\"/sessions\" class=\"form-inline w-75\" method=\"post\"><input name=\"_csrf_token\" type=\"hidden\" value=\"YTMQFzRVLzEPHzAwYXpGSA14ewdaAAAA+gGry4FVKXRjW/vqb99C6Q==\"><input name=\"_utf8\" type=\"hidden\" value=\"✓\">\n          <input type=\"text\" placeholder=\"email\" \n                             class=\"form-control\" name=\"email\">\n          <input type=\"submit\" value=\"Log in\" class=\"btn btn-primary\">\n</form>      \n\n   </nav>\n\n    <div class=\"container\">\n\n      <div class=\"row\">\n        <div class=\"col-sm-12 my-2\">\n                  </div>\n      </div>\n\n      <div class=\"row\">\n        <div class=\"col-sm-8\">\n<!-- Blog entries -->\n<div class=\"container\">  \n\n\n  <h2 class=\"my-4\">Posts Feed</h2>\n\n</div>\n        </div>\n      </div>\n\n    </div> <!-- container -->\n\n    <script src=\"/js/app.js\"></script>\n</body>\n</html>\n"

    end
  end
end
