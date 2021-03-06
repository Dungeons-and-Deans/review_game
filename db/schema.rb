# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150717145227) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_game_session_assignments", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "game_session_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "game_sessions", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "turn_group_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "name"
    t.integer  "winning_group_id"
    t.integer  "current_question_id"
    t.integer  "icon_id"
    t.integer  "min_difficulty"
    t.integer  "teacher_id"
    t.string   "canvas_file_name"
    t.string   "canvas_content_type"
    t.integer  "canvas_file_size"
    t.datetime "canvas_updated_at"
  end

  create_table "games", force: :cascade do |t|
    t.integer  "teacher_id"
    t.string   "name"
    t.integer  "movement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "story"
    t.text     "closing"
  end

  create_table "group_assignments", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "group_id"
    t.decimal  "board_x"
    t.decimal  "board_y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "active"
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "game_session_id"
    t.string   "name"
    t.integer  "score"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password"
  end

  create_table "icons", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "maps", force: :cascade do |t|
    t.integer  "game_id"
    t.string   "name"
    t.string   "file_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text     "content"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "content"
    t.integer  "difficulty_level"
    t.integer  "category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "right"
    t.integer  "wrong"
    t.text     "answer"
  end

  create_table "students", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "games_won"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supplies", force: :cascade do |t|
    t.string   "name"
    t.integer  "group_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "teachers", ["email"], name: "index_teachers_on_email", unique: true
  add_index "teachers", ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true

end
