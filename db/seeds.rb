# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create!(name: "History", teacher_id: 1)
Category.create!(name: "Math", teacher_id: 1)

Game.create!(teacher_id: 1, name: "Gameone", student_icon: "fa fa-bus", movement: 1)
Game.create!(teacher_id: 1, name: "Gametwo", student_icon: "fa fa-ship", movement: 1)
Game.create!(teacher_id: 1, name: "Gamethree", student_icon: "fa fa-taxi", movement: 1)

GameSession.create!(game_id: 1, turn_group_id: 1)
GameSession.create!(game_id: 1, turn_group_id: 2)
GameSession.create!(game_id: 2, turn_group_id: 1)
GameSession.create!(game_id: 3, turn_group_id: 1)

Group.create!(game_session_id: 1, name: "groupone", score: 350)
Group.create!(game_session_id: 1, name: "grouptwo", score: 100)
Group.create!(game_session_id: 2, name: "groupthree", score: 50)
Group.create!(game_session_id: 2, name: "groupfour", score: 70)
Group.create!(game_session_id: 3, name: "groupfive", score: 0)
Group.create!(game_session_id: 3, name: "groupsix", score: 0)
Group.create!(game_session_id: 4, name: "groupseven", score: 200)
Group.create!(game_session_id: 4, name: "groupeight", score: 200)


20.times do |t|
  GroupAssignment.create!(student_id: t, group_id: (1..8).to_a.sample, board_x: 1, board_y: 1)
end
