class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :budgets
  has_many :transactions
  has_many :categories, through: :budgets
  has_one_attached :photo, dependent: true
end
