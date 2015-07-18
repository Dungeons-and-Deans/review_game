class GameSession < ActiveRecord::Base
  has_many :groups, dependent: :destroy
  has_many :group_assignments, through: :groups
  has_many :students, through: :group_assignments
  has_many :category_game_session_assignments, dependent: :destroy
  has_many :categories, through: :category_game_session_assignments
  belongs_to :game
  belongs_to :icon

  validates :name, presence: true
  validates :icon_id, presence: true
  validates :game_id, presence: true
  validates :min_difficulty, presence: true

  accepts_nested_attributes_for :groups, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :category_game_session_assignments, allow_destroy: true

  def this_groups_turn
    Group.find_by_id(self.turn_group_id)
  end

  def check_for_group_names
    self.groups.each do |g|
      if g.name.empty?
        g.update(name: "#{Faker::Commerce.product_name}".pluralize)
      end
    end
  end

  def begin_game(categories, num_of_groups)
    make_category_assignments(categories)
    make_groups(num_of_groups)
    self.save
    self.update(turn_group_id: self.groups.first.id)
  end

  def make_category_assignments(categories)
    categories.each do |c|
      CategoryGameSessionAssignment.create(game_session_id: self.id, category_id: c)
    end
  end

  def make_groups(num_of_groups)
    num_of_groups.to_i.abs.times { self.groups.build(password: SecureRandom.hex(4), score: 0) }
  end

  def next_group
    turn = self.turn_group_id
    order = self.groups.map { |g| g.id }
    start = order.index(turn)
    (start == order.length - 1) ? spot = 0 : spot = start + 1
    until Group.find(order[spot]).active? || spot == start
      (spot == order.length - 1) ? spot = 0 : spot += 1
    end
    order[spot]
  end

  def random_question
    next_question = self.categories.sample.questions.select{|q| q.difficulty_level >= self.min_difficulty }.sample
    self.update(current_question_id: next_question.id)
    next_question
  end

end
