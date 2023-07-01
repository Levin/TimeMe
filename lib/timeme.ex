defmodule Timeme do

  def build do
    IO.puts("My tasks in total: ")
    tasks = Tasks.Task.get_all()

    for task <- tasks do
      IO.inspect(task.id)
      %Tasks.TaskType{id: _id, task_id: _, type_id: ty_id} = Tasks.TaskType.get_type_by_task_id(task.id)
      %Tasks.Type{type: type} = Tasks.Type.get_type_by_id(ty_id)
      IO.puts("Do: #{task.title} due to #{task.due_date}: #{task.description}. This task is recurring every #{type}")
    end
  end

end
