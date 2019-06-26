class MovieItem < ApplicationRecord
  attr_accessor :shelf_name
  belongs_to :movie, optional: true
  has_many :item_transactions
  validates :item_type, presence: true
  validates :movie_id, presence: true

  def to_shelf
    if self.shelf_name.nil?
      shelf_name = (self.item_type == "VHS") ? "T" : "D"
      shelf_name += Movie.find_by(id: self.movie_id).genre_id.to_s
    else
      shelf_name
    end
  end
end
