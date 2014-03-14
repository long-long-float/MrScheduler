json.array!(@class_changes) do |class_change|
  json.extract! class_change, :id, :date1, :index1, :date2, :index2
  json.url class_change_url(class_change, format: :json)
end
