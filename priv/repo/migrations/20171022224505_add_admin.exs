defmodule Microblog.Repo.Migrations.AddAdmin do
  use Ecto.Migration

  def change do
  	alter table("users") do
  		add :admin_status, :boolean, default: false
  	end

  end
end
