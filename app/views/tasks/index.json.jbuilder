json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :content, :deadline
end
