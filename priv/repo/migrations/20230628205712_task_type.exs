defmodule Timeme.Repo.Migrations.TaskType do
  use Ecto.Migration

  def change do
    create table(:types) do
      add :type, :string, default: nil

    end
  end
end
