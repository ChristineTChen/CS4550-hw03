defmodule MicroblogWeb.TagpostController do
  use MicroblogWeb, :controller

  alias Microblog.Blog
  alias Microblog.Blog.Tagpost

  def index(conn, _params) do
    tagposts = Blog.list_tagposts()
    render(conn, "index.html", tagposts: tagposts)
  end

  def new(conn, _params) do
    changeset = Blog.change_tagpost(%Tagpost{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tagpost" => tagpost_params}) do
    case Blog.create_tagpost(tagpost_params) do
      {:ok, tagpost} ->
        conn
        |> put_flash(:info, "Tagpost created successfully.")
        |> redirect(to: tagpost_path(conn, :show, tagpost))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tagpost = Blog.get_tagpost!(id)
    render(conn, "show.html", tagpost: tagpost)
  end

  def edit(conn, %{"id" => id}) do
    tagpost = Blog.get_tagpost!(id)
    changeset = Blog.change_tagpost(tagpost)
    render(conn, "edit.html", tagpost: tagpost, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tagpost" => tagpost_params}) do
    tagpost = Blog.get_tagpost!(id)

    case Blog.update_tagpost(tagpost, tagpost_params) do
      {:ok, tagpost} ->
        conn
        |> put_flash(:info, "Tagpost updated successfully.")
        |> redirect(to: tagpost_path(conn, :show, tagpost))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tagpost: tagpost, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tagpost = Blog.get_tagpost!(id)
    {:ok, _tagpost} = Blog.delete_tagpost(tagpost)

    conn
    |> put_flash(:info, "Tagpost deleted successfully.")
    |> redirect(to: tagpost_path(conn, :index))
  end
end
