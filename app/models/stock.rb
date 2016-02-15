class Stock < ActiveRecord::Base
  belongs_to :transactions
  validates :symbol, presence: true,
      length: { minimum: 2, maximum: 6 }
  validates :price, presence: true
  validates :company, presence: true,
      length: { minimum: 3 }
end
