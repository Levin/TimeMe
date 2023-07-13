defmodule Timeme.Repo.Migrations.LinkUserStatus do
  use Ecto.Migration

  def change do
    create table("link_user_status") do
      add :user_id, :integer
      add :status_id, :integer
    end
  end
end
