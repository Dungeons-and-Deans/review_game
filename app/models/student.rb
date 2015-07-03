class Student < ActiveRecord::Base
  has_many :group_assignments, dependent: :destroy
  has_many :groups, through: :group_assignments
  belongs_to :teacher

  validates :teacher_id, presence: true
  validates :games_won, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
