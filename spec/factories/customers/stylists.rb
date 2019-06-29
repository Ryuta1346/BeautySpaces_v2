FactoryBot.define do
  factory :stylist, parent: :customer, class: 'Stylist' do
    sequence(:name) { |n| "Stylist #{n}" }
    sequence(:email) { |n| "stylist#{n}@example.com" }
    password { 'foobar' }
    password_confirmation { 'foobar' }
    sequence(:tel) { |n| "000000000#{n}0" }
    features { 'String' }
    num_of_sheets { 5 }
    opening_time { '09:00' }
    closing_time { '22:00' }
    association :category
    association :prefecture
    city { 'String' }
    address1 { 'String' }
    activity_scope { 'String' }
  end
end
