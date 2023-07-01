defmodule Timeme.Repo.Migrations.TaskTypeLink do
  use Ecto.Migration

  def change do
    create table(:task_type_link) do
      add :task_id, :integer
      add :type_id, :integer
    end
  end
end
