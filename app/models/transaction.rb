class Transaction < ApplicationRecord
  validates :amount, presence: true, numericality: { message: 'must be a number'}
  validates :date, presence: true
  validates :retailer, presence: true
  validates :bank, presence: true
  validates :user_id, presence: true
  validates :categorie_id, presence: true


  belongs_to :user
  belongs_to :categorie

end
