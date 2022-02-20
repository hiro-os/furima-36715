class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :title, presence: true
  validates :version, presence: true
  validates :price, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :burdener_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :order_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "can't be blank"}
  belongs_to :category
  belongs_to :situation
  belongs_to :burdener
  belongs_to :area
  belongs_to :order_day
  has_one_attached :image
  validates :image, presence: true
  has_one :order
  belongs_to :user
end
