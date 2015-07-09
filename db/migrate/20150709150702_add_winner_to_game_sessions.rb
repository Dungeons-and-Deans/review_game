class AddWinnerToGameSessions < ActiveRecord::Migration
  def change
    add_column :game_sessions, :winning_group_id, :integer
  end
end
