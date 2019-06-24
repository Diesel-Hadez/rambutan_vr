class MovieItem < ApplicationRecord
  belongs_to :movie, optional: true
  has_many :item_transactions
end
