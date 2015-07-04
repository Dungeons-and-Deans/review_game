class CategoryGameSessionAssignment < ActiveRecord::Base
  belongs_to :category
  belongs_to :game_session
end
