class Game < ActiveRecord::Base
  has_many :maps, dependent: :destroy
  has_many :game_sessions, dependent: :destroy
  belongs_to :teacher
end
