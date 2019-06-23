FactoryBot.define do
  factory :salon, parent: :customer, class: 'Salon' do
    sequence(:name) { |n| "Salon #{n}" }
    sequence(:email) { |n| "salon#{n}@example.com" }
    password { 'foobar' }
    password_confirmation { 'foobar' }
    sequence(:tel) { |n| "0000000000#{n}" }
    features { 'String' }
    num_of_sheets { 5 }
    opening_time { '09:00' }
    closing_time { '22:00' }
    association :category
    association :prefecture
    address1 { 'String' }
    address2 { 'String' }
  end
end