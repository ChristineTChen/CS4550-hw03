defmodule Microblog.Accounts.Follow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Accounts.Follow


  schema "follows" do
    field :follower_user_id, :id
    field :following_user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Follow{} = follow, attrs) do
    follow
    |> cast(attrs, [:follower_user_id, :following_user_id])
    |> validate_required([:follower_user_id, :following_user_id])
  end
end
