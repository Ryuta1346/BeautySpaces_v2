FactoryBot.define do
  factory :stylists_reservation, class: 'Stylists::Reservation' do
    association :customer
    sequence(:reservation_time) { |n| Time.current + n.minutes }
    operation_time { 60 }
    activity_scope { "MyString" }
    memo { "MyText" }
    status { false }
  end
end
