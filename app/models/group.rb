class Group < ActiveRecord::Base
  has_many :supplies, dependent: :destroy
  has_many :group_assignments, dependent: :destroy
  has_many :students, through: :group_assignments
  belongs_to :game_session

  accepts_nested_attributes_for :group_assignments, reject_if: :all_blank, allow_destroy: true
end
