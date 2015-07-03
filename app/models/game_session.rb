class GameSession < ActiveRecord::Base
  has_many :groups, dependent: :destroy
  has_many :group_assignments, through: :groups
  belongs_to :game

  accepts_nested_attributes_for :groups, reject_if: :all_blank
end
