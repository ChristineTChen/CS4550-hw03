defmodule Microblog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Post


  schema "posts" do
    field :authorId, :string
    field :content, :string
    field :date, :utc_datetime
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :authorId, :date, :content])
    |> validate_required([:title, :authorId, :date, :content])
  end
end
