class Student < ActiveRecord::Base
  has_many :group_assignments, dependent: :destroy
  has_many :groups, through: :group_assignments
  belongs_to :teacher

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
