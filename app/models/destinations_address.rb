class DestinationAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number,

  with_options presence: true do
  validates :post_code,         format: { with: VALID_POSTAL_CODE_REGEX }
  validates :prefecture_id,     
  validates :city, 
  validates :address,
  validates :phone_number,      format: { with: VALID_PHONE_NUMBER_REGEX }
  end

  validates :building_name,


  def save
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, :phone_number: phone_number, :purchase purchase)
    Purchases.create( user_id:  user_id, product_id :product_id)
 end


end
