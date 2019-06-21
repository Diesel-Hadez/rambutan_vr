class User < ApplicationRecord
  #Taken from Michael Hartl's site
  VALID_EMAIL_REGEX     = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #Partial implementation based on customer needs and current (21/Jun/19) wikipedia listing
  #Doesn't fully implement it for leeway for future added possible ranges
  VALID_PHONENO_REGEX   =  /\A(010|011|012|013|014|016|017|018|019)[0-9]{7}\z*/
  attr_accessor :remember_token
  before_save :downcase_email
  validates :name, presence: true
  validates :dob, presence: true
  validates :address, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :phone_number, presence: true, uniqueness: true, 
    format: {with: VALID_PHONENO_REGEX},
    length: {is: 10}

  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest,is_password?(token))
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(self.remember_token))
  end

  def forget
    update_attribute(:remember_digest,nil)
  end

  private
  def downcase_email
    email.downcase!
  end

end
