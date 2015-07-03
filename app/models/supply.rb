class Supply < ActiveRecord::Base
  belongs_to :group

  validates :name, presence: true
  validates :group_id, presence: true
  validates :amount, presence: true

end
