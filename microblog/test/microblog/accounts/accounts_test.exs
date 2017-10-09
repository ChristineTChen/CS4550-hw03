defmodule Microblog.AccountsTest do
  use Microblog.DataCase

  alias Microblog.Accounts

  describe "users" do
    alias Microblog.Accounts.User

    @valid_attrs %{display_name: "some display_name", email: "some email", name: "some name"}
    @update_attrs %{display_name: "some updated display_name", email: "some updated email", name: "some updated name"}
    @invalid_attrs %{display_name: nil, email: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.display_name == "some display_name"
      assert user.email == "some email"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.display_name == "some updated display_name"
      assert user.email == "some updated email"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "follows" do
    alias Microblog.Accounts.Follow

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def follow_fixture(attrs \\ %{}) do
      {:ok, follow} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_follow()

      follow
    end

    test "list_follows/0 returns all follows" do
      follow = follow_fixture()
      assert Accounts.list_follows() == [follow]
    end

    test "get_follow!/1 returns the follow with given id" do
      follow = follow_fixture()
      assert Accounts.get_follow!(follow.id) == follow
    end

    test "create_follow/1 with valid data creates a follow" do
      assert {:ok, %Follow{} = follow} = Accounts.create_follow(@valid_attrs)
    end

    test "create_follow/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_follow(@invalid_attrs)
    end

    test "update_follow/2 with valid data updates the follow" do
      follow = follow_fixture()
      assert {:ok, follow} = Accounts.update_follow(follow, @update_attrs)
      assert %Follow{} = follow
    end

    test "update_follow/2 with invalid data returns error changeset" do
      follow = follow_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_follow(follow, @invalid_attrs)
      assert follow == Accounts.get_follow!(follow.id)
    end

    test "delete_follow/1 deletes the follow" do
      follow = follow_fixture()
      assert {:ok, %Follow{}} = Accounts.delete_follow(follow)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_follow!(follow.id) end
    end

    test "change_follow/1 returns a follow changeset" do
      follow = follow_fixture()
      assert %Ecto.Changeset{} = Accounts.change_follow(follow)
    end
  end

  describe "likes" do
    alias Microblog.Accounts.Like

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def like_fixture(attrs \\ %{}) do
      {:ok, like} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_like()

      like
    end

    test "list_likes/0 returns all likes" do
      like = like_fixture()
      assert Accounts.list_likes() == [like]
    end

    test "get_like!/1 returns the like with given id" do
      like = like_fixture()
      assert Accounts.get_like!(like.id) == like
    end

    test "create_like/1 with valid data creates a like" do
      assert {:ok, %Like{} = like} = Accounts.create_like(@valid_attrs)
    end

    test "create_like/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_like(@invalid_attrs)
    end

    test "update_like/2 with valid data updates the like" do
      like = like_fixture()
      assert {:ok, like} = Accounts.update_like(like, @update_attrs)
      assert %Like{} = like
    end

    test "update_like/2 with invalid data returns error changeset" do
      like = like_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_like(like, @invalid_attrs)
      assert like == Accounts.get_like!(like.id)
    end

    test "delete_like/1 deletes the like" do
      like = like_fixture()
      assert {:ok, %Like{}} = Accounts.delete_like(like)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_like!(like.id) end
    end

    test "change_like/1 returns a like changeset" do
      like = like_fixture()
      assert %Ecto.Changeset{} = Accounts.change_like(like)
    end
  end
end
