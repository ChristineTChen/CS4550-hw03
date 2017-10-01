defmodule MicroblogWeb.HashtagController do
  use MicroblogWeb, :controller

  alias Microblog.Blog
  alias Microblog.Blog.Hashtag

  def index(conn, _params) do
    hashtags = Blog.list_hashtags()
    render(conn, "index.html", hashtags: hashtags)
  end

  def new(conn, _params) do
    changeset = Blog.change_hashtag(%Hashtag{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"hashtag" => hashtag_params}) do
    case Blog.create_hashtag(hashtag_params) do
      {:ok, hashtag} ->
        conn
        |> put_flash(:info, "Hashtag created successfully.")
        |> redirect(to: hashtag_path(conn, :show, hashtag))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    hashtag = Blog.get_hashtag!(id)
    render(conn, "show.html", hashtag: hashtag)
  end

  def edit(conn, %{"id" => id}) do
    hashtag = Blog.get_hashtag!(id)
    changeset = Blog.change_hashtag(hashtag)
    render(conn, "edit.html", hashtag: hashtag, changeset: changeset)
  end

  def update(conn, %{"id" => id, "hashtag" => hashtag_params}) do
    hashtag = Blog.get_hashtag!(id)

    case Blog.update_hashtag(hashtag, hashtag_params) do
      {:ok, hashtag} ->
        conn
        |> put_flash(:info, "Hashtag updated successfully.")
        |> redirect(to: hashtag_path(conn, :show, hashtag))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", hashtag: hashtag, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    hashtag = Blog.get_hashtag!(id)
    {:ok, _hashtag} = Blog.delete_hashtag(hashtag)

    conn
    |> put_flash(:info, "Hashtag deleted successfully.")
    |> redirect(to: hashtag_path(conn, :index))
  end
end
