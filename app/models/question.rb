class Question < ActiveRecord::Base
  belongs_to :category

  validates :content, presence: true
  validates :difficulty_level, numericality: { greater_than: 0 }
  validates :category_id, presence: true

  def percent_correct
    if self.right > 0
      (self.right.to_f / (self.right.to_f + self.wrong.to_f) * 100).to_i
    else
      0
    end
  end

  def give_points(id)
    group = Group.find(id)
    group.update(score: group.score + self.difficulty_level)
  end

end
