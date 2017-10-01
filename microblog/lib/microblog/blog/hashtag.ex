defmodule Microblog.Blog.Hashtag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Hashtag


  schema "hashtags" do
    field :hashtag_id, :id
    field :post_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Hashtag{} = hashtag, attrs) do
    hashtag
    |> cast(attrs, [])
    |> validate_required([])
  end
end
