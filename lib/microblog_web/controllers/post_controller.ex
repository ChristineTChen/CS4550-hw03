defmodule MicroblogWeb.PostController do
  use MicroblogWeb, :controller

  alias Microblog.Blog
  alias Microblog.Blog.Post

  def index(conn, _params) do
    posts = Blog.list_posts()
    current_user = conn.assigns[:current_user]
    if current_user do 
      users = Enum.map(posts, fn(s) -> s.user_id end)
      render(conn, "index.html", posts: posts, users: users)
    else
      conn 
      |> redirect(to: "/users/new")
      |> halt()

    end
  end

  def new(conn, _params) do
    current_user = conn.assigns[:current_user]
    if current_user do 
      changeset = Blog.change_post(%Post{})
      render(conn, "new.html", changeset: changeset)
    else
      conn 
      |> redirect(to: "/users/new")
      |> halt()

    end
  end

  def create(conn, %{"post" => post_params}) do
    case Blog.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: Enum.join([post_path(conn, :show, post),"#newPost"], ""))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    user = Microblog.Accounts.get_user!(post.user_id)
    current_user = conn.assigns[:current_user]

    if current_user do
      user_liked = Microblog.Accounts.user_liked_post?(current_user.id, post.id)
      user_liked_post = user_liked
      render(conn, "show.html", post: post, user: user, user_liked_post: user_liked_post)
    else
      conn 
      |> redirect(to: "/users/new")
      |> halt()
    end 
  end

  def edit(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    current_user = conn.assigns[:current_user]
    if current_user do 
      changeset = Blog.change_post(post)
      render(conn, "edit.html", post: post, changeset: changeset)
    else
      conn 
      |> redirect(to: "/users/new")
      |> halt()

    end
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Blog.get_post!(id)

    case Blog.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: post_path(conn, :show, post))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    {:ok, _post} = Blog.delete_post(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: post_path(conn, :index))
  end
end
