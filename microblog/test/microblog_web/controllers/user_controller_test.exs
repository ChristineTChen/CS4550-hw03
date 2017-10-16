defmodule MicroblogWeb.UserControllerTest do
  use MicroblogWeb.ConnCase

  alias Microblog.Accounts

  @create_attrs %{display_name: "some display_name", email: "some email", name: "some name"}
  @update_attrs %{display_name: "some updated display_name", email: "some updated email", name: "some updated name"}
  @invalid_attrs %{display_name: nil, email: nil, name: nil}

  def fixture(:user) do
    {:ok, user} = Accounts.create_user(@create_attrs)
    user
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get conn, user_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Users"
    end
  end

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get conn, user_path(conn, :new)
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "create user" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == user_path(conn, :show, id)

      conn = get conn, user_path(conn, :show, id)
      assert "<!DOCTYPE html>\n<html lang=\"en\">\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <meta name=\"description\" content=\"\">\n    <meta name=\"author\" content=\"\">\n\n    <title>Hello Microblog!</title>\n    <link rel=\"stylesheet\" href=\"/css/app.css\">\n  </head>\n\n\n  <body>\n\n   <!-- Attribution: Nav bar from lecture code-->\n   <nav class=\"navbar navbar-dark bg-dark navbar-expand-md\">\n      <a class=\"navbar-brand\" href=\"/posts\">Microblog</a>\n\n      <button class=\"navbar-toggler\" type=\"button\"\n              data-toggle=\"collapse\" data-target=\"#main-navbar\">\n        <span class=\"navbar-toggler-icon\"></span>\n      </button>\n\n      <div class=\"collapse navbar-collapse\" id=\"main-navbar\">\n        <ul class=\"navbar-nav mr-auto\">\n          <li class=\"nav-item\">\n<a class=\"nav-link\" href=\"/posts\">Posts</a>\t  </li>\n\t  <li class=\"nav-item\">\n<a class=\"nav-link\" href=\"/users\">Users</a>\t  </li>\n\t  <li class=\"nav-item\">\n<a class=\"nav-link\" href=\"/users/new\">New User</a>          </li>\n        </ul>\n      </div>\n\n        <form accept-charset=\"UTF-8\" action=\"/sessions\" class=\"form-inline w-75\" method=\"post\"><input name=\"_csrf_token\" type=\"hidden\" value=\"PyY5AxUiRzhnIRJMBAt/HRYXDSIZNgAANkRNxK3i+Hh8ayG/afFKCQ==\"><input name=\"_utf8\" type=\"hidden\" value=\"✓\">\n          <input type=\"text\" placeholder=\"email\" \n                             class=\"form-control\" name=\"email\">\n          <input type=\"submit\" value=\"Log in\" class=\"btn btn-primary\">\n</form>      \n\n   </nav>\n\n    <div class=\"container\">\n\n      <div class=\"row\">\n        <div class=\"col-sm-12 my-2\">\n            <p class=\"alert alert-info\" role=\"alert\">User created successfully.</p>\n                  </div>\n      </div>\n\n      <div class=\"row\">\n        <div class=\"col-sm-8\">\n<h2>Welcome to some display_name's Profile!</h2>\n\n<div class=\"col-lg-8 col-sm-6\">\n <div class=\"well-lg\">\n  <div class=\"card hovercard\">\n\n\t<div class=\"card-body\">\n    \t  <h4 class=\"card-title\"> some name's Bio: </h4>\n\t\n\t  <p class=\"card-text\">\n\t    Pen name: some display_name\n            </br>\n            Email: some email\n\t  </p>\n\n       </div>\n     \n\n    <div class=\"btn-pref btn-group btn-group-justified btn-group-lg\" role=\"group\" aria-label=\"...\">\n\n      <div class=\"btn-group\" role=\"group\">\n        <span><a class=\"btn btn-primary\" href=\"/posts\">Posts</a>\n        </span>\n      </div>\n\n      <div class=\"btn-group\" role=\"group\">\n        <span><a class=\"btn btn-primary\" href=\"/users\">Followers</a>\n        </span>\n      </div>\n\n      <div class=\"btn-group\" role=\"group\">\n        <span><a class=\"btn btn-primary\" href=\"/users\">Following</a>\n        </span>\n      </div>\n   </div>\n\n  </div>\n\n </div>\n\n<span><a class=\"btn btn-primary\" href=\"/users\">Back</a></span>\n</div>\n\n        </div>\n      </div>\n\n    </div> <!-- container -->\n\n    <script src=\"/js/app.js\"></script>\n</body>\n</html>\n"

    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: @invalid_attrs
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "edit user" do
    setup [:create_user]

    test "renders form for editing chosen user", %{conn: conn, user: user} do
      conn = get conn, user_path(conn, :edit, user)
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "update user" do
    setup [:create_user]

    test "redirects when data is valid", %{conn: conn, user: user} do
      conn = put conn, user_path(conn, :update, user), user: @update_attrs
      assert redirected_to(conn) == user_path(conn, :show, user)

      conn = get conn, user_path(conn, :show, user)
      assert html_response(conn, 200) =~ "some updated display_name"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put conn, user_path(conn, :update, user), user: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete conn, user_path(conn, :delete, user)
      assert redirected_to(conn) == user_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, user_path(conn, :show, user)
      end
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end
end
