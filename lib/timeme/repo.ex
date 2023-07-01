defmodule Timeme.Repo do
  alias Tasks.Task
  use Ecto.Repo,
    otp_app: :timeme,
    adapter: Ecto.Adapters.Postgres


    def insert_task(title, description, due_date) do
          Timeme.Repo.insert!(%Tasks.Task{title: title, description: description, due_date: due_date})
    end

    def get_task_by_title(title) do
      Timeme.Repo.get_by!(Task, title: title)
    end

    def get_task_by_id(id) do
      Timeme.Repo.get_by!(Task, id: id)
    end

    def remove_task(title) do
      task = Timeme.Repo.get_task_by_title(title)
      case Timeme.Repo.delete task do
        {:ok, struct}       -> struct
        {:error, _changeset} -> true
      end
    end

    def insert_type(type_scheme) do
      Timeme.Repo.insert!(type_scheme)
    end

    def get_type_by_title(type_title) do
      Timeme.Repo.get_by!(Tasks.Type, type: type_title)
    end

    def get_type_by_id(type_id) do
      Timeme.Repo.get_by!(Tasks.Type, id: type_id)
    end

    def remove_type(type_title) do
      type = Timeme.Repo.get_type_by_title(type_title)
      case Timeme.Repo.delete type do
        {:ok, res} -> res
        {:error, _} -> true
      end
    end

    def connector(struct) do
      Timeme.Repo.insert!(struct)
    end

    def tasktype_type_by_task_id(id) do
      Timeme.Repo.get_by!(Tasks.TaskType, task_id: id)
    end

    def get_tasktype_by_task_id(id) do
      Timeme.Repo.get_by!(Tasks.TaskType, task_id: id)
    end

    def get_tasktype_by_type_id(id) do
      Timeme.Repo.query("SELECT task_id FROM task_type_link WHERE type_id = #{id}")
    end




end
