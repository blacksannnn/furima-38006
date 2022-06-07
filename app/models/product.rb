class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :delivaery_charge
  belongs_to :prefecture
  belongs_to :delivaery_charge

end
