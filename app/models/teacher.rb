class Teacher < ActiveRecord::Base
  has_many :categories, dependent: :destroy
  has_many :questions, through: :categories
  has_many :students, dependent: :destroy
  has_many :games, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def available_games
    Game.where(teacher_id: [self.id, nil]) 
  end
end
