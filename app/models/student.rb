class Student < ActiveRecord::Base
  has_many :group_assignments, dependent: :destroy
  belongs_to :teacher

  validates :teacher_id, presence: true
  validates :games_won, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

end
