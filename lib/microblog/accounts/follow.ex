defmodule Microblog.Accounts.Follow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Accounts.Follow


  schema "follows" do
    belongs_to :follower_user, Microblog.Accounts.User
    belongs_to :following_user, Microblog.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Follow{} = follow, attrs) do
    follow
    |> cast(attrs, [:follower_user_id, :following_user_id])
    |> validate_required([])
  end
end
