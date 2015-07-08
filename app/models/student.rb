class Student < ActiveRecord::Base
  has_many :group_assignments, dependent: :destroy
  has_many :groups, through: :group_assignments
  belongs_to :teacher

  validates :first_name, presence: true
  validates :last_name, presence: true

  # before_create :set_games_won

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def unassigned?(game_session_id)
    GameSession.find(game_session_id).groups.each do |id|
      return if GroupAssignment.where(student_id: self.id).find_by_group_id(id)
    end
  end

  def active?
    if self.active
      '<i class="fa fa-star"></i>'
    else
      '<i class="fa fa-frown-o"></i>'
    end
  end

  # private def set_games_won
  #   self.games_won = 0
  # end

end
