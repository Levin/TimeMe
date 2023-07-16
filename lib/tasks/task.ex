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
    #[day, month, year] = String.split(due_date, "-") |> Enum.map(&String.to_integer/1)
    #{:ok, parsed_date} = Date.from_iso8601("#{year}-#{month}-#{day}")
    #IO.inspect(Date.from_iso8601(due_date))
    Timeme.Repo.insert_task(title, description, due_date)
    #TODO: get task by id in connect_task_with_type, getting errors because its returning multiple rows
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

  def display_todays_tasks() do
    tasks = Repo.get_tasks_from_today()
  end
  def display_this_weeks_tasks() do
    tasks = Repo.get_tasks_from_this_week()
  end

end
