class AddMinDifficultyToGameSessions < ActiveRecord::Migration
  def change
    add_column :game_sessions, :min_difficulty, :string
    add_column :game_sessions, :integer, :string
  end
end
