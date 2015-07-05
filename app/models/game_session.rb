class GameSession < ActiveRecord::Base
  has_many :groups, dependent: :destroy
  has_many :group_assignments, through: :groups
  has_many :students, through: :group_assignments
  has_many :category_game_session_assignments
  has_many :categories, through: :category_game_session_assignments
  belongs_to :game

  accepts_nested_attributes_for :groups, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :category_game_session_assignments, allow_destroy: true

  def current_group
    Group.find(self.turn_group_id)
  end

  def begin_game(categories, num_of_groups)
    categories.each do |c|
      CategoryGameSessionAssignment.create(game_session_id: self.id, category_id: c)
    end
    num_of_groups.to_i.abs.times { self.groups.build(password: SecureRandom.hex(4), score: 0) }
    self.save
    self.update(turn_group_id: self.groups.first.id)
  end

  def next_group
    turn = self.turn_group_id
    order = self.groups.map {|g| g.id}
    spot = order.index(turn)
    (spot == order.length - 1) ? spot = 0 : spot += 1
    order[spot]
  end

end
