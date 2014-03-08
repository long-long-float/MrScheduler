json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :content, :deadline
  json.url task_url(task, format: :json)
end
