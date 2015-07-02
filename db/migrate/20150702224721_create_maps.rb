class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.integer :game_id
      t.string :name
      t.string :file_path

      t.timestamps null: false
    end
  end
end
