# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create!(name: "History", teacher_id: 1)
Category.create!(name: "Math", teacher_id: 1)

4.times do |c|
  CategoryGameSessionAssignment.create!(category_id: 1, game_session_id: 1+c)
  CategoryGameSessionAssignment.create!(category_id: 2, game_session_id: 1+c)
end

Game.create!(teacher_id: 1, name: "Gameone", icon_id: 1, movement: 1)
Game.create!(teacher_id: 1, name: "Gametwo", icon_id: 2, movement: 1)
Game.create!(teacher_id: 1, name: "Gamethree", icon_id: 3, movement: 1)

GameSession.create!(game_id: 1, turn_group_id: 1, name: "First Period")
GameSession.create!(game_id: 1, turn_group_id: 3, name: "Second Period")
GameSession.create!(game_id: 2, turn_group_id: 5, name: "Third Period")
GameSession.create!(game_id: 3, turn_group_id: 7, name: "Fouth Period")

Group.create!(game_session_id: 1, name: "groupone", score: 350, password: "password")
Group.create!(game_session_id: 1, name: "grouptwo", score: 100, password: "password")
Group.create!(game_session_id: 2, name: "groupthree", score: 50, password: "password")
Group.create!(game_session_id: 2, name: "groupfour", score: 70, password: "password")
Group.create!(game_session_id: 3, name: "groupfive", score: 0, password: "password")
Group.create!(game_session_id: 3, name: "groupsix", score: 0, password: "password")
Group.create!(game_session_id: 4, name: "groupseven", score: 200, password: "password")
Group.create!(game_session_id: 4, name: "groupeight", score: 200, password: "password")

Icon.create(name: "Bus", description: "fa fa-bus")
Icon.create(name: "Ship", description: "fa fa-ship")
Icon.create(name: "Taxi", description: "fa fa-taxi")
Icon.create(name: "Circle", description: "fa fa-circle")
Icon.create(name: "Person", description: "fa fa-child")
Icon.create(name: "Jet", description: "fa fa-fighter-jet")
Icon.create(name: "Bug", description: "fa fa-bug")
Icon.create(name: "Flag", description: "fa fa-flag")

Teacher.create!(first_name: "Test", last_name: "Tester", email: "test@test.com",
    password: 'testtest', password_confirmation: 'testtest')

20.times do |t|
  GroupAssignment.create!(student_id: t+1, group_id: (1..8).to_a.sample, board_x: 1, board_y: 1, active: [true, false].sample)
end

5.times do
  Supply.create(name: "stick", amount: (1..5).to_a.sample, group_id: (1..8).to_a.sample)
  Supply.create(name: "apple", amount: (1..5).to_a.sample, group_id: (1..8).to_a.sample)
  Supply.create(name: "walkie-talkie", amount: 2, group_id: (1..8).to_a.sample)
  Supply.create(name: "water balloon", amount: (10..50).to_a.sample, group_id: (1..8).to_a.sample)
  Supply.create(name: "money", amount: (50..100).to_a.sample, group_id: (1..8).to_a.sample)
end

20.times do
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
      teacher_id: 1, games_won: [1, 2, 3].sample)
end

Question.create(content: "Who was the first US president?", difficulty_level: 1,
  category_id: 1)
Question.create(content: "In what year did the Revolutionary war start", difficulty_level: 1,
  category_id: 1)
Question.create(content: "Name two Native American tribes form North Carolina", difficulty_level: 4,
  category_id: 1)
Question.create(content: "What is the pythagorean theorem?", difficulty_level: 3,
  category_id: 2)
Question.create(content: "What is the square root of 25", difficulty_level: 1,
  category_id: 2)
Question.create(content: "Solve for x: x+2=5", difficulty_level: 2,
  category_id: 2)

Map.create(game_id: 1, name: "Yellowstone", file_path: "http://yellowstone.net/maps/files/2012/06/yellowstone-map.jpg")
Map.create(game_id: 2, name: "School Map", file_path: "http://www.ptisd.org/users/0001/docs/ptjh%20map_lockers%20b.jpg")
Map.create(game_id: 3, name: "USA", file_path: "https://www.superteacherworksheets.com/graphics1920x1080/1920-usa-blank.jpg")
