class MoveIconToGameSessions < ActiveRecord::Migration
  def change
    add_column :game_sessions, :icon_id, :integer
    remove_column :games, :icon_id, :string
  end
end
