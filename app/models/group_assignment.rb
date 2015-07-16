class GroupAssignment < ActiveRecord::Base
  belongs_to :group
  belongs_to :student

  validates :student_id, presence: true
  validates :group_id, presence: true
# 14, 20, 6

  def self.assign(group_id, student_id, game_session_id)
    possible_groups = Group.where(game_session_id: game_session_id).map{|g| g.id}
    possible_groups.each do |g|
      group = GroupAssignment.where(group_id: g).find_by_student_id(student_id)
      group.delete if group
    end
    if group_id != "0"
      num_of_members = Group.find(group_id).students.count + 0
      x = ((possible_groups.index(group_id.to_i)) * 200) + (num_of_members * 30)
      GroupAssignment.create!(group_id: group_id, student_id: student_id, board_x: x, board_y: 84, active: true)
    end
  end

end
