class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :image,                     presence: true
  validates :product_name,              presence: true
  validates :description,               presence: true
  validates :category_id,               numericality: { other_than: 1, message: "can't be blank" }
  validates :product_condition_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,             numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id,           numericality: { other_than: 1, message: "can't be blank" }
  validates :price,                     numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 99_999_999 },
                                        format: { with: /\A[0-9]+\z/ }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day
end
