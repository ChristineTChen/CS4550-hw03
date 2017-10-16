defmodule Microblog.Repo.Migrations.CreateHashtags do
  use Ecto.Migration

  def change do
    create table(:hashtags) do
      add :tag_name, :string

      timestamps()
    end

  end
end
