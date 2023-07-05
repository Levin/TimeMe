defmodule Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks.Task
  alias Tasks.Type
  alias Timeme.Repo



  def changeset(struct, params) do
    struct
    |> cast(params, [:title, :description,:due_date])
    |> validate_required([:title, :due_date])
    |> validate_length(:name, min: 3)
  end

  schema "tasks" do
    field :title, :string
    field :description, :string
    field :due_date, :string
  end

  # umschreiben auf new_task(title, description, due_date, type) evtl
  def new_task(%Task{title: title, description: description, due_date: due_date} = task, %Type{type: _typ} = type) do
    Timeme.Repo.insert_task(title, description, due_date)
    Tasks.TaskType.connect_task_with_type(task, type)

  end

  def remove_task(title) do
    Repo.remove_task(title)
  end

  def get_all do
    Timeme.Repo.all(Task)
  end

  def display_tasks_by_type(t_id) do
    case Tasks.TaskType.get_type_by_type_id(t_id) do
      {:ok, %Postgrex.Result{rows: task_ids}} -> Enum.map(List.flatten(task_ids), &(Timeme.Repo.get_task_by_id(&1)))
    end
  end

end
