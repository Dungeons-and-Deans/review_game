class AddActiveToGroupAssignments < ActiveRecord::Migration
  def change
    add_column :group_assignments, :active, :boolean
  end
end
