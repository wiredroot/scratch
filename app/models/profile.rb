class Profile < ActiveRecord::Base
  has_many :transactions
  validates :firstname, presence: true,
      length: { minimum: 3}
  validates :lastname, presence: true,
      length: { minimum: 3 }  

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
      length: { minimum: 6 },
      uniqueness: { case_sensitive: false},
      format: { with: VALID_EMAIL_REGEX }

  validates :password, presence: true,
      length: { minimum: 8}
  has_secure_password
end
