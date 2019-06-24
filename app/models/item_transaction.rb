class ItemTransaction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :movie_item, optional: true
end
