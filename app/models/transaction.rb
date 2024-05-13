class Transaction < ApplicationRecord
  validates :amount, presence: true, numericality: true
  validates :date, presence: true
  validates :retailer, presence: true
  validates :bank, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :category
end
