class Game < ActiveRecord::Base
  has_many :maps, dependent: :destroy
  has_many :game_sessions, dependent: :destroy
  belongs_to :teacher

  validates :name, presence: true
  validates :movement, numericality: { greater_than: 0 }

end
