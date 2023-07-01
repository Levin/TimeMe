defmodule Tasks.TaskType do
  use Ecto.Schema
  alias Timeme.Repo

  schema "task_type_link" do
    field :task_id, :integer
    field :type_id, :integer
  end

  def connect_task_with_type(%Tasks.Task{title: task_title}, %Tasks.Type{type: type_title}) do
    %Tasks.Task{id: task_id} = Timeme.Repo.get_task_by_title(task_title)
    %Tasks.Type{id: type_id} = Timeme.Repo.get_type_by_title(type_title)

    Repo.connector(%Tasks.TaskType{task_id: task_id, type_id: type_id})
  end


  def get_type_by_task_id(task_id) do
    Timeme.Repo.tasktype_type_by_task_id(task_id)
  end

  def get_task_by_type_id(task_id) do
    Timeme.Repo.get_tasktype_by_task_id(task_id)
  end

  def get_type_by_type_id(type_id) do
    Timeme.Repo.get_tasktype_by_type_id(type_id)
  end

end
