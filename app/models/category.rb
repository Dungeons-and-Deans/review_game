class Category < ActiveRecord::Base
  has_many :questions
  belongs_to :teacher

  accepts_nested_attributes_for :questions, reject_if: :all_blank

  validates :name, presence: true
  validates :teacher_id, presence: true

end
