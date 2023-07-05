defmodule Timeme.Repo.Migrations.AddStatus do
  use Ecto.Migration

  def change do
    create table("status") do
      add :status_id, :integer
      add :title, :string
    end
  end
end
