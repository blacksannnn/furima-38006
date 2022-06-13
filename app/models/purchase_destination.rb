class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number

  
  validates :prefecture_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :city,              presence: true
  validates :address,           presence: true
  validates :building_name,     presence: true
  
  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/
  validates :post_code,         format: { with: VALID_POSTAL_CODE_REGEX }

  VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
  validates :phone_number,      format: { with: VALID_PHONE_NUMBER_REGEX }



  def save
    purchase = Purchase.create( user_id:  user_id, product_id: product_id)
    destination = Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase: purchase)
  end


end
