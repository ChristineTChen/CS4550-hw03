defmodule Microblog.Repo.Migrations.CreateTagposts do
  use Ecto.Migration

  def change do
    create table(:tagposts) do
      add :hashtag_id, references(:hashtags, on_delete: :nothing)
      add :post_id, references(:posts, on_delete: :nothing)

      timestamps()
    end

    create index(:tagposts, [:hashtag_id])
    create index(:tagposts, [:post_id])
  end
end
