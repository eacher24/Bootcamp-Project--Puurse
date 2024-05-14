class Transaction < ApplicationRecord
  validates :amount, presence: true, numericality: true
  validates :date, presence: true
  validates :retailer, presence: true
  validates :bank, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :category

  include PgSearch::Model
  pg_search_scope :search_by_category_id,
    against: [ :category_id],
    using: {
      tsearch: { prefix: false } # <-- now `superman batm` will return something!
    }
end
