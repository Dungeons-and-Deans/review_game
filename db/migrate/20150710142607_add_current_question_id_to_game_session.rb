class AddCurrentQuestionIdToGameSession < ActiveRecord::Migration
  def change
    add_column :game_sessions, :current_question_id, :integer
  end
end
