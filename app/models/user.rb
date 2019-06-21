class User < ApplicationRecord
  #Taken from Michael Hartl's site
  VALID_EMAIL_REGEX     = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #Partial implementation based on customer needs and current (21/Jun/19) wikipedia listing
  #Doesn't fully implement it for leeway for future added possible ranges
  VALID_PHONENO_REGEX   =  /\A(010|011|012|013|014|016|017|018|019)[0-9]{7}\z*/
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

  private
  def downcase_email
    email.downcase!
  end

end
