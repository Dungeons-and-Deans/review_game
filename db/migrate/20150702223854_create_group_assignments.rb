class CreateGroupAssignments < ActiveRecord::Migration
  def change
    create_table :group_assignments do |t|
      t.integer :student_id
      t.integer :group_id
      t.decimal :board_x
      t.decimal :board_y

      t.timestamps null: false
    end
  end
end
