class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :user_id
    validates :item_id
    validates :house_number
    validates :phone_number, numericality: { with: /\A\d{10,11}\z/, message: "Input only number" }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number,  order_id: order.id)
  end


end  