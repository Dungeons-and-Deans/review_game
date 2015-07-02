json.array!(@categories) do |category|
  json.extract! category, :id, :name, :teacher_id
  json.url category_url(category, format: :json)
end
