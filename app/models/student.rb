class Student < ActiveRecord::Base
  has_many :group_assignments, dependent: :destroy
  has_many :groups, through: :group_assignments
  belongs_to :teacher

  validates :first_name, presence: true
  validates :last_name, presence: true

  before_create :set_games_won

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private def set_games_won
    self.games_won = 0
  end

end
