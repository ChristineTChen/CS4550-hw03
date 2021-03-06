defmodule MicroblogWeb.UserController do
  use MicroblogWeb, :controller

  alias Microblog.Accounts
  alias Microblog.Accounts.User
  alias Microblog.Accounts.Follow

  def index(conn, _params) do
    users = Accounts.list_users()
    current_user = conn.assigns[:current_user]
    if current_user do 
      render(conn, "index.html", users: users)
    else
      conn 
      |> redirect(to: "/")
      |> halt()

    end
  end

  def new(conn, _params) do
    current_user = conn.assigns[:current_user]
    if !current_user do 
      changeset = Accounts.change_user(%User{})
      render(conn, "new.html", changeset: changeset)
    else
      conn 
      |> redirect(to: "/posts")
      |> halt()

    end
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    current_user = conn.assigns[:current_user]

    if current_user do
      post = Microblog.Blog.change_post(%Microblog.Blog.Post{user_id: user.id})
      follow = Accounts.change_follow(%Microblog.Accounts.Follow{follower_user_id: current_user.id, following_user_id: user.id})
      render(conn, "show.html", current_user: current_user, user: user, post: post, follow: follow)
    else
      conn
      |> redirect(to: "/")
      |> halt()
    end
  end

  def edit(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    current_user = conn.assigns[:current_user]
    if current_user do 
      if current_user.admin_status || current_user.id == user.id do
        changeset = Accounts.change_user(user)
        render(conn, "edit.html", user: user, changeset: changeset)
      else
        conn
        |> redirect(to: "/posts")
        |> halt()
      end

    else
      conn 
      |> redirect(to: "/users/new")
      |> halt()

    end
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    case Accounts.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    {:ok, _user} = Accounts.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: user_path(conn, :index))
  end
end
