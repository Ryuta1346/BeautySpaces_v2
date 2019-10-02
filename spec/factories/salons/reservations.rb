FactoryBot.define do
  factory :salons_reservation, class: 'Salons::Reservation' do
    association :customer
    sequence(:reservation_time) { |n| Time.current + n.minutes }
    operation_time { 60 }
    memo { "MyText" }
    status { false }
  end
end