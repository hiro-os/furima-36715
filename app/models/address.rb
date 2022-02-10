class Address < ApplicationRecord
  validates :postcode, presence: true
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city, presence: true
  validates :street, presence: true
  validates :building, presence: true
  validates :phone, presence: true
  validates :phone, format: {with: /\A[0-9]{11}\z/ }
  belongs_to :order
end
