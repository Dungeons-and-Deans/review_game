class AddMinDifficultyToGameSessions < ActiveRecord::Migration
  def change
    add_column :game_sessions, :min_difficulty, :integer
  end
end
