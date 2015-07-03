class Question < ActiveRecord::Base
  belongs_to :category

  validates :content, presence: true
  validates :difficulty_level, presence: true
  validates :category_id, presence: true

end
