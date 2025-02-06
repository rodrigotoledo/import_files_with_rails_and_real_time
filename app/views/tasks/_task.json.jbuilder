json.extract! task, :id, :title, :description, :ends_at, :created_at, :updated_at
json.url task_url(task, format: :json)
