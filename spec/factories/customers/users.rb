FactoryBot.define do
  factory :user, parent: :customer, class: 'User' do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'foobar' }
    password_confirmation { 'foobar' }
    sequence(:tel) { |n| "00000000#{n}00" }
    association :prefecture
    city { 'String' }
    address1 { 'String' }
  end
end
