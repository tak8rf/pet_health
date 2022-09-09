json.extract! task, :id, :title, :content, :start_time, :created_at, :updated_at
json.url task_url(task, format: :json)
