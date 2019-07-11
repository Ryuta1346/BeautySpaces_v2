FactoryBot.define do
  factory :salons_reservation, class: 'Salons::Reservation' do
    association :customer
    sequence(:reservation_time) { |n| "2019-0#{12-n}-01 12:00:00" }
    operation_time { 60 }
    memo { "MyText" }
    status { false }
  end
end
