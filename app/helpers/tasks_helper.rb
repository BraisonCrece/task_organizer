module TasksHelper
  def task_badge(task)
    case task.category.name 
    when "desarrollo"
      "badge text-bg-primary"
    when "mercadeo" 
      "badge text-bg-success"
    when "conceptualización"
      "badge text-bg-warning"
    when "ejercicios"
      "badge text-bg-danger"
    end
  end
end
