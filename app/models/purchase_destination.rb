class PurchaseDestination
  include ActiveModel::Model
  attr_accessor  :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :token, :product_id

  
  #validates :prefecture_id,     numericality: { other_than: 1, message: "can't be blank" }
  #validates :city,              presence: true
  #validates :address,           presence: true
      
  
  #VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/
  #validates :post_code,         format: { with: VALID_POSTAL_CODE_REGEX }

  #VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/
  #validates :phone_number,      format: { with: VALID_PHONE_NUMBER_REGEX }

  #validates :token, presence: true

  def save
    purchase = Purchase.create( user_id:  user_id, product_id: product_id)
    destination = Destination.create(purchase_id: purchase.id, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end


end
