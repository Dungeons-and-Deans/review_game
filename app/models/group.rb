class Group < ActiveRecord::Base
  has_many :supplies, dependent: :destroy
  has_many :group_assignments, dependent: :destroy
  has_many :students, through: :group_assignments
  has_many :notes
  belongs_to :game_session

  accepts_nested_attributes_for :group_assignments, reject_if: :all_blank, allow_destroy: true


  def new_win
    self.students.each { |s| s.update(games_won: s.games_won + 1) }
  end

  def active?
    self.group_assignments.any? { |g| g.active }
  end

  def group_turn?
    self.id == GameSession.find(self.game_session_id).turn_group_id
  end

end
