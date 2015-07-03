class Teacher < ActiveRecord::Base
  has_many :categories, dependent: :destroy
  has_many :questions, through: :categories
  has_many :students, dependent: :destroy
  has_many :games, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
