class AddStatisticsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :right, :integer
    add_column :questions, :wrong, :integer
  end
end
