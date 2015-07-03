class Map < ActiveRecord::Base
  belongs_to :game

  validates :name, presence: true
  validates :game_id, presence: true
  validates :file_path, presence: true


end
