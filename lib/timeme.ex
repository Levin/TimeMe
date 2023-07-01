defmodule Timeme do

  def build do
    IO.puts("My tasks in total: ")
    tasks = Tasks.Task.get_all()

    for %Tasks.Task{id: id, title: title, description: description, due_date: due_date} <- tasks do
      IO.inspect(id)
      %Tasks.TaskType{id: _id, task_id: _, type_id: ty_id} = Tasks.TaskType.get_type_by_task_id(id)
      %Tasks.Type{type: type} = Tasks.Type.get_type_by_id(ty_id)
      IO.puts("Do: #{title} due to #{due_date}: #{description}. This task is recurring every #{type}")
    end
  end

  def display_tasks_for_this(%Tasks.Type{id: t_id, type: type}) do
    tasks = Tasks.Task.display_tasks_by_type(t_id)
    IO.inspect("Following tasks should #{type} tasks:")
    for task <- tasks do
      task.title
    end

  end


end
