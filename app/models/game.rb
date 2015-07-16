class Game < ActiveRecord::Base
  has_many :maps, dependent: :destroy
  has_many :game_sessions, dependent: :destroy
  belongs_to :teacher

  validates :name, presence: true
  validates :movement, numericality: { greater_than: 0 }

  def available_game_sessions(id)
    if self.teacher_id.nil?
      GameSession.where(teacher_id: id).where(game_id: self.id)
    else
      self.game_sessions
    end
  end

end
