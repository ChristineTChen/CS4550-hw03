defmodule Microblog.Repo.Migrations.CreateTagposts do
  use Ecto.Migration

  def change do
    create table(:tagposts) do
      add :hashtag_id, references(:hashtags, on_delete: :delete_all)
      add :post_id, references(:posts, on_delete: :delete_all)

      timestamps()
    end

    create index(:tagposts, [:hashtag_id])
    create index(:tagposts, [:post_id])
  end
end
