defmodule MicroblogWeb.FollowController do
  use MicroblogWeb, :controller

  alias Microblog.Accounts
  alias Microblog.Accounts.Follow

  def index(conn, _params) do
    follows = Accounts.list_follows()
    current_user = conn.assigns[:current_user]
    if current_user do 
      if current_user.admin_status do
        render(conn, "index.html", follows: follows)
      else
        conn
        |> redirect(to: "/posts")
        |> halt()
      end

    else
      conn 
      |> redirect(to: "/")
      |> halt()

    end

  end

  def new(conn, _params) do
    current_user = conn.assigns[:current_user]
    if current_user do 
      changeset = Accounts.change_follow(%Follow{})
      render(conn, "new.html", changeset: changeset)
    else
      conn 
      |> redirect(to: "/")
      |> halt()

    end
    
  end

  def create(conn, %{"follow" => follow_params}) do
    case Accounts.create_follow(follow_params) do
      {:ok, follow} ->
        conn
        |> put_flash(:info, "Follow created successfully.")
        |> redirect(to: follow_path(conn, :show, follow))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    follow = Accounts.get_follow!(id)
    current_user = conn.assigns[:current_user]
    if current_user do 
      render(conn, "show.html", follow: follow)
    else
      conn 
      |> redirect(to: "/")
      |> halt()

    end
    
  end

  def edit(conn, %{"id" => id}) do
    current_user = conn.assigns[:current_user]
    if current_user do 
      follow = Accounts.get_follow!(id)
      changeset = Accounts.change_follow(follow)
      render(conn, "edit.html", follow: follow, changeset: changeset)
    else
      conn 
      |> redirect(to: "/")
      |> halt()

    end
  end

  def update(conn, %{"id" => id, "follow" => follow_params}) do
    follow = Accounts.get_follow!(id)

    case Accounts.update_follow(follow, follow_params) do
      {:ok, follow} ->
        conn
        |> put_flash(:info, "Follow updated successfully.")
        |> redirect(to: follow_path(conn, :show, follow))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", follow: follow, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    follow = Accounts.get_follow!(id)
    {:ok, _follow} = Accounts.delete_follow(follow)

    conn
    |> put_flash(:info, "Follow deleted successfully.")
    |> redirect(to: follow_path(conn, :index))
  end
end
