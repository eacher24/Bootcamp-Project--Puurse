class Budget < ApplicationRecord
  validates :max_limit, presence:true, numericality:true
  validates :user_id, presence: true
  validates :category_id, presence: true

  belongs_to :user
  belongs_to :category
end


#validates :max_limit, presence: true, numericality: { greater_than_or_equal_to: 0 }
