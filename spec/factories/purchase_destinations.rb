FactoryBot.define do
  factory :purchase_destination do
    token { 'tok_abcdefghijk00000000000000000' }

    post_code       { '123-4567' }
    prefecture_id   { '2' }
    city            { '金沢市金沢町' }
    address         { '1-1' }
    phone_number    { '09011112222' }

    user_id         { 'cus_xxxxxxxxxxxxxx' }
    product_id      { 'car_yyyyyyyyyyyyyyy' }
    
  end
end
