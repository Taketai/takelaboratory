class DonationOrder
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :shipping_area_id, :city_name, :block_name, :building_name, :phone_number, :donation_id, :user_id

  with_options presence: true do
    validates :token, :city_name, :block_name
    validates :shipping_area_id , numericality: { other_than: 1 }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id, :donation_id
    
  end

    def save
      order = Order.create(user_id: user_id, donation_id: donation_id)
      Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id , city_name: city_name, block_name: block_name, building_name: building_name, phone_number: phone_number, order_id: order.id)
    end
end