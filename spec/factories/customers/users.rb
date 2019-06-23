FactoryBot.define do
  factory :user, parent: :customer, class:'User' do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'foobar' }
    password_confirmation { 'foobar' }
    sequence(:tel) { |n| "00000000#{n}00" }
    association :prefecture
    address1 { 'String' }
    address2 { 'String' }
  end
end
