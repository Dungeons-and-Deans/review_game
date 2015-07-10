class Question < ActiveRecord::Base
  belongs_to :category

  validates :content, presence: true
  validates :difficulty_level, numericality: { greater_than: 0 }
  validates :category_id, presence: true

  def percent_correct
    (self.right.to_f / (self.right.to_f + self.wrong.to_f) * 100).to_i
  end

end
