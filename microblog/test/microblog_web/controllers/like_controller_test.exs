defmodule MicroblogWeb.LikeControllerTest do
  use MicroblogWeb.ConnCase

  alias Microblog.Accounts
  alias Microblog.Accounts.Like

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:like) do
    {:ok, like} = Accounts.create_like(@create_attrs)
    like
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all likes", %{conn: conn} do
      conn = get conn, like_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  defp create_like(_) do
    like = fixture(:like)
    {:ok, like: like}
  end
end
