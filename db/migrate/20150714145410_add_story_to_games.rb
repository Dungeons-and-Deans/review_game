class AddStoryToGames < ActiveRecord::Migration
  def change
    add_column :games, :story, :text
    add_column :games, :closing, :text
  end
end
