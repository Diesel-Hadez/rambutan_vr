class ItemTransaction < ApplicationRecord
  before_create :create_pickup_token
  before_create :create_return_token
  belongs_to :user, optional: true
  belongs_to :movie_item, optional: true
  private
  def create_return_token
    self.pickup_token = SecureRandom.urlsafe_base64
  end
  def create_pickup_token
    self.return_token = SecureRandom.urlsafe_base64
  end
end
