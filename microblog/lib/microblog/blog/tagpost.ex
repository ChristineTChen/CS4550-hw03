defmodule Microblog.Blog.Tagpost do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Tagpost


  schema "tagposts" do
    field :hashtag_id, :id
    field :post_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Tagpost{} = tagpost, attrs) do
    tagpost
    |> cast(attrs, [])
    |> validate_required([])
  end
end
