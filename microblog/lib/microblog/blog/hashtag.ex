defmodule Microblog.Blog.Hashtag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Hashtag


  schema "hashtags" do
    field :tag_name, :string

    timestamps()
  end

  @doc false
  def changeset(%Hashtag{} = hashtag, attrs) do
    hashtag
    |> cast(attrs, [:tag_name])
    |> validate_required([:tag_name])
  end
end
