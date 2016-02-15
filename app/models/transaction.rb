class Transaction < ActiveRecord::Base
  belongs_to :profile
  has_one :stock
end
