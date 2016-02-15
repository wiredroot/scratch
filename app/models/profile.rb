class Profile < ActiveRecord::Base
  has_many :transactions
  validates :firstname, presence: true,
      length: { minimum: 3}
  validates :lastname, presence: true,
      length: { minimum: 3 }  
  validates :email, presence: true,
      length: { minimum: 3 }  

  validates :dob, presence: true
  validates :hired, presence: true
end
