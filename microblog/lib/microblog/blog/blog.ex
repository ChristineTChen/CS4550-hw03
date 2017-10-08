defmodule Microblog.Blog do
  @moduledoc """
  The Blog context.
  """

  import Ecto.Query, warn: false
  alias Microblog.Repo

  alias Microblog.Blog.Post

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts do
    Repo.all(Post)
    |> Repo.preload(:user)
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post!(id) do
    Repo.get!(Post, id)
    |> Repo.preload(:user)
  end

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{source: %Post{}}

  """
  def change_post(%Post{} = post) do
    Post.changeset(post, %{})
  end

  alias Microblog.Blog.Hashtag

  @doc """
  Returns the list of hashtags.

  ## Examples

      iex> list_hashtags()
      [%Hashtag{}, ...]

  """
  def list_hashtags do
    Repo.all(Hashtag)
  end

  @doc """
  Gets a single hashtag.

  Raises `Ecto.NoResultsError` if the Hashtag does not exist.

  ## Examples

      iex> get_hashtag!(123)
      %Hashtag{}

      iex> get_hashtag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hashtag!(id), do: Repo.get!(Hashtag, id)

  @doc """
  Creates a hashtag.

  ## Examples

      iex> create_hashtag(%{field: value})
      {:ok, %Hashtag{}}

      iex> create_hashtag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hashtag(attrs \\ %{}) do
    %Hashtag{}
    |> Hashtag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hashtag.

  ## Examples

      iex> update_hashtag(hashtag, %{field: new_value})
      {:ok, %Hashtag{}}

      iex> update_hashtag(hashtag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hashtag(%Hashtag{} = hashtag, attrs) do
    hashtag
    |> Hashtag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Hashtag.

  ## Examples

      iex> delete_hashtag(hashtag)
      {:ok, %Hashtag{}}

      iex> delete_hashtag(hashtag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hashtag(%Hashtag{} = hashtag) do
    Repo.delete(hashtag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hashtag changes.

  ## Examples

      iex> change_hashtag(hashtag)
      %Ecto.Changeset{source: %Hashtag{}}

  """
  def change_hashtag(%Hashtag{} = hashtag) do
    Hashtag.changeset(hashtag, %{})
  end

  alias Microblog.Blog.Tagpost

  @doc """
  Returns the list of tagposts.

  ## Examples

      iex> list_tagposts()
      [%Tagpost{}, ...]

  """
  def list_tagposts do
    Repo.all(Tagpost)
  end

  @doc """
  Gets a single tagpost.

  Raises `Ecto.NoResultsError` if the Tagpost does not exist.

  ## Examples

      iex> get_tagpost!(123)
      %Tagpost{}

      iex> get_tagpost!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tagpost!(id), do: Repo.get!(Tagpost, id)

  @doc """
  Creates a tagpost.

  ## Examples

      iex> create_tagpost(%{field: value})
      {:ok, %Tagpost{}}

      iex> create_tagpost(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tagpost(attrs \\ %{}) do
    %Tagpost{}
    |> Tagpost.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tagpost.

  ## Examples

      iex> update_tagpost(tagpost, %{field: new_value})
      {:ok, %Tagpost{}}

      iex> update_tagpost(tagpost, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tagpost(%Tagpost{} = tagpost, attrs) do
    tagpost
    |> Tagpost.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tagpost.

  ## Examples

      iex> delete_tagpost(tagpost)
      {:ok, %Tagpost{}}

      iex> delete_tagpost(tagpost)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tagpost(%Tagpost{} = tagpost) do
    Repo.delete(tagpost)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tagpost changes.

  ## Examples

      iex> change_tagpost(tagpost)
      %Ecto.Changeset{source: %Tagpost{}}

  """
  def change_tagpost(%Tagpost{} = tagpost) do
    Tagpost.changeset(tagpost, %{})
  end
end
