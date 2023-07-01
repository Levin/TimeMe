defmodule Timeme.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string, default: nil, null: false
      add :description, :string, default: nil
      add :due_date, :string, default: nil
    end
  end
end
