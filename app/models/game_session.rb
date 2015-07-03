class GameSession < ActiveRecord::Base
  has_many :groups, dependent: :destroy
  belongs_to :game
end
