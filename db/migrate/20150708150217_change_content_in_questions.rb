class ChangeContentInQuestions < ActiveRecord::Migration
  def change
    change_column :questions, :content, :text
  end
end
