class Question < ActiveRecord::Base
  belongs_to :category

  validates :content, presence: true
  validates :difficulty_level, numericality: { greater_than: 0 }
  validates :category_id, presence: true

end
