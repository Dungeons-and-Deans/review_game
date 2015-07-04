class CreateCategoryGameSessionAssignments < ActiveRecord::Migration
  def change
    create_table :category_game_session_assignments do |t|
      t.integer :category_id
      t.integer :game_session_id

      t.timestamps null: false
    end
  end
end
