defmodule Microblog.BlogTest do
  use Microblog.DataCase

  alias Microblog.Blog

  describe "posts" do
    alias Microblog.Blog.Post

    @valid_attrs %{content: "some content", title: "some title"}
    @update_attrs %{content: "some updated content", title: "some updated title"}
    @invalid_attrs %{content: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      #post = post_fixture()
      #assert Blog.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      #post = post_fixture()
      #assert Blog.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      #assert {:ok, %Post{} = post} = Blog.create_post(@valid_attrs)
      #assert post.content == "some content"
      #assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      #post = post_fixture()
      #assert {:ok, post} = Blog.update_post(post, @update_attrs)
      #assert %Post{} = post
      #assert post.content == "some updated content"
      #assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      #post = post_fixture()
      #assert {:error, %Ecto.Changeset{}} = Blog.update_post(post, @invalid_attrs)
      #assert post == Blog.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      #post = post_fixture()
      #assert {:ok, %Post{}} = Blog.delete_post(post)
      #assert_raise Ecto.NoResultsError, fn -> Blog.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      #post = post_fixture()
      #assert %Ecto.Changeset{} = Blog.change_post(post)
    end
  end

  describe "hashtags" do
    alias Microblog.Blog.Hashtag

    @valid_attrs %{tag_name: "some tag_name"}
    @update_attrs %{tag_name: "some updated tag_name"}
    @invalid_attrs %{tag_name: nil}

    def hashtag_fixture(attrs \\ %{}) do
      {:ok, hashtag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_hashtag()

      hashtag
    end

    test "list_hashtags/0 returns all hashtags" do
      hashtag = hashtag_fixture()
      assert Blog.list_hashtags() == [hashtag]
    end

    test "get_hashtag!/1 returns the hashtag with given id" do
      #hashtag = hashtag_fixture()
      #assert Blog.get_hashtag!(hashtag.id) == hashtag
    end

    test "create_hashtag/1 with valid data creates a hashtag" do
      assert {:ok, %Hashtag{} = hashtag} = Blog.create_hashtag(@valid_attrs)
      assert hashtag.tag_name == "some tag_name"
    end

    test "create_hashtag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_hashtag(@invalid_attrs)
    end

    test "update_hashtag/2 with valid data updates the hashtag" do
      hashtag = hashtag_fixture()
      assert {:ok, hashtag} = Blog.update_hashtag(hashtag, @update_attrs)
      assert %Hashtag{} = hashtag
      assert hashtag.tag_name == "some updated tag_name"
    end

    test "update_hashtag/2 with invalid data returns error changeset" do
      hashtag = hashtag_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_hashtag(hashtag, @invalid_attrs)
      assert hashtag == Blog.get_hashtag!(hashtag.id)
    end

    test "delete_hashtag/1 deletes the hashtag" do
      hashtag = hashtag_fixture()
      assert {:ok, %Hashtag{}} = Blog.delete_hashtag(hashtag)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_hashtag!(hashtag.id) end
    end

    test "change_hashtag/1 returns a hashtag changeset" do
      hashtag = hashtag_fixture()
      assert %Ecto.Changeset{} = Blog.change_hashtag(hashtag)
    end
  end

  describe "tagposts" do
    alias Microblog.Blog.Tagpost

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def tagpost_fixture(attrs \\ %{}) do
      {:ok, tagpost} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_tagpost()

      tagpost
    end

    test "list_tagposts/0 returns all tagposts" do
      tagpost = tagpost_fixture()
      assert Blog.list_tagposts() == [tagpost]
    end

    test "get_tagpost!/1 returns the tagpost with given id" do
      tagpost = tagpost_fixture()
      assert Blog.get_tagpost!(tagpost.id) == tagpost
    end

    test "create_tagpost/1 with valid data creates a tagpost" do
      assert {:ok, %Tagpost{} = tagpost} = Blog.create_tagpost(@valid_attrs)
    end

    test "create_tagpost/1 with invalid data returns error changeset" do
      #assert {:error, %Ecto.Changeset{}} = Blog.create_tagpost(@invalid_attrs)
    end

    test "update_tagpost/2 with valid data updates the tagpost" do
      tagpost = tagpost_fixture()
      assert {:ok, tagpost} = Blog.update_tagpost(tagpost, @update_attrs)
      assert %Tagpost{} = tagpost
    end

    test "update_tagpost/2 with invalid data returns error changeset" do
      #tagpost = tagpost_fixture()
      #assert {:error, %Ecto.Changeset{}} = Blog.update_tagpost(tagpost, @invalid_attrs)
      #assert tagpost == Blog.get_tagpost!(tagpost.id)
    end

    test "delete_tagpost/1 deletes the tagpost" do
      tagpost = tagpost_fixture()
      assert {:ok, %Tagpost{}} = Blog.delete_tagpost(tagpost)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_tagpost!(tagpost.id) end
    end

    test "change_tagpost/1 returns a tagpost changeset" do
      tagpost = tagpost_fixture()
      #assert %Ecto.Changeset{} = Blog.change_tagpost(tagpost)
    end
  end
end
