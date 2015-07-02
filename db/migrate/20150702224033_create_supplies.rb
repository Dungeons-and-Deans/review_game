class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :name
      t.integer :group_id
      t.integer :amount

      t.timestamps null: false
    end
  end
end
