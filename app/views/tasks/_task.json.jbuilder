json.extract! task, :id, :name, :description, :estimated, :due_on, :created_at, :updated_at
json.url task_url(task, format: :json)
