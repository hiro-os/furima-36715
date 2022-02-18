class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :area_id, :city, :street, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :street
    validates :phone
    validates :phone, format: {with: /\A[0-9]{11}\z/ }
    validates :token

    validates :item_id
    validates :user_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, area_id: area_id, city: city, street: street, building: building, phone: phone, order_id: order.id)
  end
end