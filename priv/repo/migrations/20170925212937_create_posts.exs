defmodule Microblog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :postId, :integer
      add :title, :string
      add :authorId, :string
      add :date, :utc_datetime
      add :content, :text

      timestamps()
    end

  end
end
