class Budget < ApplicationRecord
  validates :max_limit, presence: true, numericality: { message: 'must be a number'}

  belongs_to :user
  belongs_to :categorie
end
