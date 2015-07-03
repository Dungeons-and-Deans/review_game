class GroupAssignment < ActiveRecord::Base
  belongs_to :group
  belongs_to :student

  validates :student_id, presence: true
  validates :group_id, presence: true

end
