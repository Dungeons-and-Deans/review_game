class Student < ActiveRecord::Base
  has_many :group_assignments, dependent: :destroy
  belongs_to :teacher
end
