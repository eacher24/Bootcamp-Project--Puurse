class Category < ApplicationRecord
  validates :name, presence: true

  has_many :transactions
  has_many :budgets
  has_many :categories, through: :budgets
end
