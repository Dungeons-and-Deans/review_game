class AddTeacherIdToGameSessions < ActiveRecord::Migration
  def change
    add_column :game_sessions, :teacher_id, :integer
  end
end
