defmodule Microblog.Accounts.Like do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Accounts.Like


  schema "likes" do
    belongs_to :user, Microblog.Accounts.User
    belongs_to :post, Microblog.Blog.Post

    timestamps()
  end

  @doc false
  def changeset(%Like{} = like, attrs) do
    like
    |> cast(attrs, [:user_id, :post_id])
    |> validate_required([:user_id, :post_id])
  end
end
