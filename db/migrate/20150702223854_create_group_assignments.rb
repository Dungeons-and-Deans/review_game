class CreateGroupAssignments < ActiveRecord::Migration
  def change
    create_table :group_assignments do |t|
      t.integer :student_id
      t.integer :group_id
      t.integer :board_x
      t.integer :board_y

      t.timestamps null: false
    end
  end
end
