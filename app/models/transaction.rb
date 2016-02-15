class Transaction < ActiveRecord::Base
  has_one :profile
  has_one :stock
end
