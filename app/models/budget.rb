class Budget < ApplicationRecord
  validates :max_limit, presence:true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  belongs_to :category
end
