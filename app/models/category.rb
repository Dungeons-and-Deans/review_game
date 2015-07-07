class Category < ActiveRecord::Base
  has_many :questions
  has_many :category_game_session_assignments
  has_many :game_sessions, through: :category_game_session_assignments
  belongs_to :teacher

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :teacher_id, presence: true

end
