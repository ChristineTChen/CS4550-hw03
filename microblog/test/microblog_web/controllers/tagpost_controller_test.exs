defmodule MicroblogWeb.TagpostControllerTest do
  use MicroblogWeb.ConnCase

  alias Microblog.Blog

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:tagpost) do
    {:ok, tagpost} = Blog.create_tagpost(@create_attrs)
    tagpost
  end

  describe "index" do
    test "lists all tagposts", %{conn: conn} do
      conn = get conn, tagpost_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Tagposts"
    end
  end

  describe "new tagpost" do
    test "renders form", %{conn: conn} do
      conn = get conn, tagpost_path(conn, :new)
      assert html_response(conn, 200) =~ "New Tagpost"
    end
  end

  describe "create tagpost" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, tagpost_path(conn, :create), tagpost: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == tagpost_path(conn, :show, id)

      conn = get conn, tagpost_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Tagpost"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, tagpost_path(conn, :create), tagpost: @invalid_attrs
      assert html_response(conn, 200) =~ "New Tagpost"
    end
  end

  describe "edit tagpost" do
    setup [:create_tagpost]

    test "renders form for editing chosen tagpost", %{conn: conn, tagpost: tagpost} do
      conn = get conn, tagpost_path(conn, :edit, tagpost)
      assert html_response(conn, 200) =~ "Edit Tagpost"
    end
  end

  describe "update tagpost" do
    setup [:create_tagpost]

    test "redirects when data is valid", %{conn: conn, tagpost: tagpost} do
      conn = put conn, tagpost_path(conn, :update, tagpost), tagpost: @update_attrs
      assert redirected_to(conn) == tagpost_path(conn, :show, tagpost)

      conn = get conn, tagpost_path(conn, :show, tagpost)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, tagpost: tagpost} do
      conn = put conn, tagpost_path(conn, :update, tagpost), tagpost: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Tagpost"
    end
  end

  describe "delete tagpost" do
    setup [:create_tagpost]

    test "deletes chosen tagpost", %{conn: conn, tagpost: tagpost} do
      conn = delete conn, tagpost_path(conn, :delete, tagpost)
      assert redirected_to(conn) == tagpost_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, tagpost_path(conn, :show, tagpost)
      end
    end
  end

  defp create_tagpost(_) do
    tagpost = fixture(:tagpost)
    {:ok, tagpost: tagpost}
  end
end
