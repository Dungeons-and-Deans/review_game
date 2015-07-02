class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :game_session_id
      t.string :name
      t.integer :score

      t.timestamps null: false
    end
  end
end
