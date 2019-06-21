class Movie < ApplicationRecord
  VALID_GENRE_REGEX = /\A(Action|Drama|Comedy|Sci-Fi|Fantasy|Horror|Thriller)\z/
  has_many :movie_items, dependent: :destroy
  has_and_belongs_to_many :actors

  validates :name,                      presence: true
  validates :genre_id, :genre_exists,   presence: true, numericality: { only_integer: true }
  validates :release_date,              presence: true
  validates :minutes,                   presence: true   

  def genre_exists
    if (!Genre.find_by(id: genre_id))
      errors.add(:genre_id, "not found")
    end
  end
end
