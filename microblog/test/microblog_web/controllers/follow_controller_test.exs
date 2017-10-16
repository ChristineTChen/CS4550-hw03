defmodule MicroblogWeb.FollowControllerTest do
  use MicroblogWeb.ConnCase

  alias Microblog.Accounts

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:follow) do
    {:ok, follow} = Accounts.create_follow(@create_attrs)
    follow
  end

  describe "index" do
    test "lists all follows", %{conn: conn} do
      conn = get conn, follow_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Follows"
    end
  end

  describe "new follow" do
    test "renders form", %{conn: conn} do
      conn = get conn, follow_path(conn, :new)
      assert "<!DOCTYPE html>\n<html lang=\"en\">\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <meta name=\"description\" content=\"\">\n    <meta name=\"author\" content=\"\">\n\n    <title>Hello Microblog!</title>\n    <link rel=\"stylesheet\" href=\"/css/app.css\">\n  </head>\n\n\n  <body>\n\n   <!-- Attribution: Nav bar from lecture code-->\n   <nav class=\"navbar navbar-dark bg-dark navbar-expand-md\">\n      <a class=\"navbar-brand\" href=\"/posts\">Microblog</a>\n\n      <button class=\"navbar-toggler\" type=\"button\"\n              data-toggle=\"collapse\" data-target=\"#main-navbar\">\n        <span class=\"navbar-toggler-icon\"></span>\n      </button>\n\n      <div class=\"collapse navbar-collapse\" id=\"main-navbar\">\n        <ul class=\"navbar-nav mr-auto\">\n          <li class=\"nav-item\">\n<a class=\"nav-link\" href=\"/posts\">Posts</a>\t  </li>\n\t  <li class=\"nav-item\">\n<a class=\"nav-link\" href=\"/users\">Users</a>\t  </li>\n\t  <li class=\"nav-item\">\n<a class=\"nav-link\" href=\"/users/new\">New User</a>          </li>\n        </ul>\n      </div>\n\n        <form accept-charset=\"UTF-8\" action=\"/sessions\" class=\"form-inline w-75\" method=\"post\"><input name=\"_csrf_token\" type=\"hidden\" value=\"ZF9uAxUMURUmI0EIcREVXkBvbEkAJgAAPgEKDJhLTrqaZDT9w9//qw==\"><input name=\"_utf8\" type=\"hidden\" value=\"✓\">\n          <input type=\"text\" placeholder=\"email\" \n                             class=\"form-control\" name=\"email\">\n          <input type=\"submit\" value=\"Log in\" class=\"btn btn-primary\">\n</form>      \n\n   </nav>\n\n    <div class=\"container\">\n\n      <div class=\"row\">\n        <div class=\"col-sm-12 my-2\">\n                  </div>\n      </div>\n\n      <div class=\"row\">\n        <div class=\"col-sm-8\">\n<h2>Would You Like to Follow This Person?</h2>\n\n<form accept-charset=\"UTF-8\" action=\"/follows\" method=\"post\"><input name=\"_csrf_token\" type=\"hidden\" value=\"ZF9uAxUMURUmI0EIcREVXkBvbEkAJgAAPgEKDJhLTrqaZDT9w9//qw==\"><input name=\"_utf8\" type=\"hidden\" value=\"✓\">  \n  \n  <div class=\"form-group\">\n<button class=\"btn btn-success\" type=\"submit\">Yes!</button>  </div>\n</form>\n<span><a href=\"/follows\">Back</a></span>\n        </div>\n      </div>\n\n    </div> <!-- container -->\n\n    <script src=\"/js/app.js\"></script>\n</body>\n</html>\n"

    end
  end

  describe "create follow" do

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, follow_path(conn, :create), follow: @invalid_attrs
      assert "<!DOCTYPE html>\n<html lang=\"en\">\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <meta name=\"description\" content=\"\">\n    <meta name=\"author\" content=\"\">\n\n    <title>Hello Microblog!</title>\n    <link rel=\"stylesheet\" href=\"/css/app.css\">\n  </head>\n\n\n  <body>\n\n   <!-- Attribution: Nav bar from lecture code-->\n   <nav class=\"navbar navbar-dark bg-dark navbar-expand-md\">\n      <a class=\"navbar-brand\" href=\"/posts\">Microblog</a>\n\n      <button class=\"navbar-toggler\" type=\"button\"\n              data-toggle=\"collapse\" data-target=\"#main-navbar\">\n        <span class=\"navbar-toggler-icon\"></span>\n      </button>\n\n      <div class=\"collapse navbar-collapse\" id=\"main-navbar\">\n        <ul class=\"navbar-nav mr-auto\">\n          <li class=\"nav-item\">\n<a class=\"nav-link\" href=\"/posts\">Posts</a>\t  </li>\n\t  <li class=\"nav-item\">\n<a class=\"nav-link\" href=\"/users\">Users</a>\t  </li>\n\t  <li class=\"nav-item\">\n<a class=\"nav-link\" href=\"/users/new\">New User</a>          </li>\n        </ul>\n      </div>\n\n        <form accept-charset=\"UTF-8\" action=\"/sessions\" class=\"form-inline w-75\" method=\"post\"><input name=\"_csrf_token\" type=\"hidden\" value=\"LQwqWwAUbzRnNAg7I3sKE3doO0A2JgAAo8sjYDWxPFckFCdQ9GW1Aw==\"><input name=\"_utf8\" type=\"hidden\" value=\"✓\">\n          <input type=\"text\" placeholder=\"email\" \n                             class=\"form-control\" name=\"email\">\n          <input type=\"submit\" value=\"Log in\" class=\"btn btn-primary\">\n</form>      \n\n   </nav>\n\n    <div class=\"container\">\n\n      <div class=\"row\">\n        <div class=\"col-sm-12 my-2\">\n                  </div>\n      </div>\n\n      <div class=\"row\">\n        <div class=\"col-sm-8\">\n<h2>Would You Like to Follow This Person?</h2>\n\n<form accept-charset=\"UTF-8\" action=\"/follows\" method=\"post\"><input name=\"_csrf_token\" type=\"hidden\" value=\"LQwqWwAUbzRnNAg7I3sKE3doO0A2JgAAo8sjYDWxPFckFCdQ9GW1Aw==\"><input name=\"_utf8\" type=\"hidden\" value=\"✓\">  \n    <div class=\"alert alert-danger\">\n      <p>Oops, something went wrong! Please check the errors below.</p>\n    </div>\n\n  \n  <div class=\"form-group\">\n<button class=\"btn btn-success\" type=\"submit\">Yes!</button>  </div>\n</form>\n<span><a href=\"/follows\">Back</a></span>\n        </div>\n      </div>\n\n    </div> <!-- container -->\n\n    <script src=\"/js/app.js\"></script>\n</body>\n</html>\n"

    end
  end

  defp create_follow(_) do
    follow = fixture(:follow)
    {:ok, follow: follow}
  end
end
