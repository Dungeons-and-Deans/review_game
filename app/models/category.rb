class Category < ActiveRecord::Base
  has_many :questions
  belongs_to :teacher

  accepts_nested_attributes_for :questions, reject_if: :all_blank
end
