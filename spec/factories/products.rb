FactoryBot.define do
  factory :product do
    product_name         { 'product' }       
    description           {'descriptin'}     
    category_id            {'2'}    
    product_condition_id    {'2'}  
    prefecture_id            {'2'}
    delivery_charge_id        {'2'}
    delivery_day_id           {'2'}
    price                     {'300'}
    
  after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end

   association :user
  
  end
end
