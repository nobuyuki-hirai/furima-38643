class OrderBuyer
  include ActiveModel::Model
  attr_accessor :post_code, :ship_area_id, :city, :address, :build_name, :phone_number, :user_id, :order_id, :item_id, :token

  with_options presence: true do
    validates  :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates  :phone_number, format: { with: /\A\d{10,11}\z/, message: "PhoneNumber must be 10or11 digit Half-width numbers" }
    validates  :city, :address, :user_id, :item_id, :token
  end
  validates  :ship_area_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(post_code: post_code, ship_area_id: ship_area_id, city: city, address: address, build_name: build_name, phone_number: phone_number, order_id: order.id)
  end
end