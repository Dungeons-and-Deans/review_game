class GroupAssignment < ActiveRecord::Base
  belongs_to :group
  belongs_to :student

  validates :student_id, presence: true
  validates :group_id, presence: true


  def self.assign(group_id, student_id, game_session_id)
    possible_groups = Group.where(game_session_id: game_session_id).map{|g| g.id}

  end
end
