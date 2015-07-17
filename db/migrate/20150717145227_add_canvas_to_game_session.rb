class AddCanvasToGameSession < ActiveRecord::Migration
  def change
    add_attachment :game_sessions, :canvas
  end
end
