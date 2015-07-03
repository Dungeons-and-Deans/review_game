class Group < ActiveRecord::Base
  has_many :supplies, dependent: :destroy
  has_many :group_assignments, dependent: :destroy
  belongs_to :game_session

  accepts_nested_attributes_for :group_assignments, reject_if: :all_blank

  validates :name, presence: true
  validates :game_session_id, presence: true
  validates :score, presence: true

end
