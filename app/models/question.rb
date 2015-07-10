class Question < ActiveRecord::Base
  belongs_to :category

  validates :content, presence: true
  validates :difficulty_level, numericality: { greater_than: 0 }
  validates :category_id, presence: true

  def percent_correct
    (self.right / (self.right + self.wrong)) * 100
  end

  def percent_incorrect
    (self.wrong / (self.right + self.wrong)) * 100
  end

end
