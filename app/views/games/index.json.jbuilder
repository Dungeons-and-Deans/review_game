json.array!(@games) do |game|
  json.extract! game, :id, :teacher_id, :name, :student_icon, :movement
  json.url game_url(game, format: :json)
end
