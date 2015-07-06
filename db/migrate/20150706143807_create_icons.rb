class CreateIcons < ActiveRecord::Migration
  def change
    create_table :icons do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
