json.extract! task, :id, :name, :description, :duration, :due_on, :created_at, :updated_at
json.category do
  if task.category
    json.extract! task.category, :name, :color
  else
    nil
  end
end
json.url task_url(task, format: :json)
