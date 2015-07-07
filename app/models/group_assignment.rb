class GroupAssignment < ActiveRecord::Base
  belongs_to :group
  belongs_to :student

  validates :student_id, presence: true
  validates :group_id, presence: true


  def self.assign(group_id, student_id, game_session_id)
    possible_groups = Group.where(game_session_id: game_session_id).map{|g| g.id}
    possible_groups.each do |g|
      group = GroupAssignment.where(group_id: g).find_by_student_id(student_id)
      group.delete if group
    end
    GroupAssignment.create(group_id: group_id, student_id: student_id)
  end

end
