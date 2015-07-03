class Group < ActiveRecord::Base
  has_many :supplies, dependent: :destroy
  has_many :group_assignments, dependent: :destroy
  belongs_to :game_session
end
