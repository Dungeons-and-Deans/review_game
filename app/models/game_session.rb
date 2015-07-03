class GameSession < ActiveRecord::Base
  has_many :groups, dependent: :destroy
  has_many :group_assignments, through: :groups
  has_many :students, through: :group_assignments
  belongs_to :game

  accepts_nested_attributes_for :groups, reject_if: :all_blank, allow_destroy: true

  validates :game_id, presence: true
  validates :turn_group_id, presence: true

end
