json.extract! task, :id, :name, :description, :duration, :due_on, :created_at, :updated_at
json.category task.category, :name, :color
json.url task_url(task, format: :json)
