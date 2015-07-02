class CreateGameSessions < ActiveRecord::Migration
  def change
    create_table :game_sessions do |t|
      t.integer :game_id
      t.integer :turn_group_id

      t.timestamps null: false
    end
  end
end
