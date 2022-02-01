class Product < ApplicationRecord
  has_one :address
  belongs_to :user
end
