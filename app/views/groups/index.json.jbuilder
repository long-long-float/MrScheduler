json.array!(@groups) do |group|
  json.extract! group, :id, :name, :quiz, :answer
  json.url group_url(group, format: :json)
end
