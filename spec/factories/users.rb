FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    contact_number { Faker::PhoneNumber.cell_phone_with_country_code}
    city { 'Bilimora' }
    state { 'Gujarat' }
    country { 'India' }
  end
end
