class MovieItem < ApplicationRecord
  belongs_to :movie, optional: true
  has_many :item_transactions
  validates :item_type, presence: true
  validates :movie_id, presence: true
end
