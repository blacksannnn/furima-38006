FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name { '斉藤' }
    first_name { '太朗' }
    family_name_kana { 'サイトウ' }
    first_name_kana { 'タロウ' }
    birth_day { '2022-06-05' }
  end
end
