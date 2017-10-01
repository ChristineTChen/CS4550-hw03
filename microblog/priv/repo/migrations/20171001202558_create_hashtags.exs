defmodule Microblog.Repo.Migrations.CreateHashtags do
  use Ecto.Migration

  def change do
    create table(:hashtags) do
      add :hashtag_id, references(:hashtags, on_delete: :nothing)
      add :post_id, references(:posts, on_delete: :nothing)

      timestamps()
    end

    create index(:hashtags, [:hashtag_id])
    create index(:hashtags, [:post_id])
  end
end
