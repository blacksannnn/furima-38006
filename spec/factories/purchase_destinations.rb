FactoryBot.define do
  factory :purchase_destination do
    post_code       { '123-4567' }
    prefecture_id   { '2' }
    city            { '金沢市金沢町' }
    address         { '1-1' }
    building_name   { 'kanazawa' }
    phone_number    { '090-1111-2222'}    
  end
end
