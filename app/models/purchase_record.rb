class PurchaseRecord < ApplicationRecord
  belongs_to :dtb_products
  has_one :dtb_shippings
end
