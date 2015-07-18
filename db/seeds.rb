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

Game.create!(name: "Yellowstone", movement: 1,
    story: "You are a wolf.  Your group members are your pack.  Your mission is to dominante Yellowstone.",
    closing: "Congratulations, you are the most successful wolf pack. Your genes will live on in the ecosystem.")
Game.create!(name: "Waterballoon Fight", movement: 1,
    story: "Today, you can run wild in the school.  Someone brought waterballoons.  If you get wet, you are out!",
    closing: "Congratulations, you are the best at avoiding water balloons!")
Game.create!(name: "America Map", movement: 1,
    story: "A story",
    closing: "Congratulations!!")

GameSession.create!(game_id: 1, turn_group_id: 1, name: "First Period", icon_id: 4, min_difficulty: 1, teacher_id: 1)
GameSession.create!(game_id: 2, turn_group_id: 5, name: "Third Period", icon_id: 6, min_difficulty: 1, teacher_id: 1)
GameSession.create!(game_id: 3, turn_group_id: 7, name: "Fouth Period", icon_id: 7, min_difficulty: 1, teacher_id: 1)

Group.create!(game_session_id: 1, name: "Leopards", score: 350, password: "password1")
Group.create!(game_session_id: 1, name: "Lions", score: 100, password: "password2")
Group.create!(game_session_id: 1, name: "Tigers", score: 50, password: "password3")
Group.create!(game_session_id: 2, name: "Bobcats", score: 70, password: "password4")
Group.create!(game_session_id: 2, name: "Ocelots", score: 0, password: "password5")
Group.create!(game_session_id: 2, name: "Cheetahs", score: 0, password: "password6")
Group.create!(game_session_id: 3, name: "Jaguars", score: 200, password: "password7")
Group.create!(game_session_id: 3, name: "Mountain Lions", score: 200, password: "password8")

Icon.create(name: "Bus", description: "fa fa-bus")
Icon.create(name: "Ship", description: "fa fa-ship")
Icon.create(name: "Taxi", description: "fa fa-taxi")
Icon.create(name: "Circle", description: "fa fa-circle")
Icon.create(name: "Person", description: "fa fa-child")
Icon.create(name: "Jet", description: "fa fa-fighter-jet")
Icon.create(name: "Bug", description: "fa fa-bug")
Icon.create(name: "Flag", description: "fa fa-flag")

Teacher.create!(first_name: "Anna", last_name: "Bedell", email: "anna@classquest.com",
    password: 'password', password_confirmation: 'password')

20.times do |t|
  GroupAssignment.create!(student_id: t+1, group_id: (1..8).to_a.sample, board_x: 500, board_y: 500, active: [true, false].sample)
end

5.times do
  Supply.create(name: "sticks", amount: (1..5).to_a.sample, group_id: (1..8).to_a.sample)
  Supply.create(name: "apples", amount: (1..5).to_a.sample, group_id: (1..8).to_a.sample)
  Supply.create(name: "walkie-talkies", amount: 2, group_id: (1..8).to_a.sample)
  Supply.create(name: "water balloons", amount: (10..50).to_a.sample, group_id: (1..8).to_a.sample)
  Supply.create(name: "gold", amount: (50..100).to_a.sample, group_id: (1..8).to_a.sample)
end

20.times do
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
      teacher_id: 1, games_won: [1, 2, 3].sample)
end

Question.create(content: "Who was the first US president?", difficulty_level: 1,
  category_id: 1, right: 0, wrong: 0, answer: "George Washington")
Question.create(content: "In what year did the Revolutionary war start", difficulty_level: 1,
  category_id: 1, right: 0, wrong: 0, answer: "1775")
Question.create(content: "Name two Native American tribes form North Carolina", difficulty_level: 4,
  category_id: 1, right: 0, wrong: 0, answer: "Catawba, Cherokee, Creek, Croatan, Tuscarora, Tutelo, Saponi")
Question.create(content: "What is the pythagorean theorem?", difficulty_level: 3,
  category_id: 2, right: 0, wrong: 0, answer: "a^2 + b^2 = c^2")
Question.create(content: "What is the square root of 25", difficulty_level: 1,
  category_id: 2, right: 0, wrong: 0, answer: "5")
Question.create(content: "Solve for x: x+2=5", difficulty_level: 2,
  category_id: 2, right: 0, wrong: 0, answer: "3")

Map.create(game_id: 1, name: "Yellowstone", file_path: "http://yellowstone.net/maps/files/2012/06/yellowstone-map.jpg")
Map.create(game_id: 2, name: "School Map", file_path: "http://www.ptisd.org/users/0001/docs/ptjh%20map_lockers%20b.jpg")
Map.create(game_id: 3, name: "USA", file_path: "https://www.superteacherworksheets.com/graphics1920x1080/1920-usa-blank.jpg")


Group.all.each do |group|
  Note.create(content: Faker::Lorem.sentence, group_id: group.id)
  Note.create(content: Faker::Lorem.sentence, group_id: group.id)
end
