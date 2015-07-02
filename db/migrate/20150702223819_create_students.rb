class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :teacher_id
      t.integer :games_won
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
