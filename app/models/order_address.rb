class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :address, :phone_number, :building, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/}, length: {in: 1..11}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
      phone_number: phone_number, order_id: order.id, building: building)
  end

end
