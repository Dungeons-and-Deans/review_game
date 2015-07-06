class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :teacher_id
      t.string :name
      t.string :icon_id
      t.integer :movement

      t.timestamps null: false
    end
  end
end
