FactoryBot.define do
  factory :salons_reservation, class: 'Salons::Reservation' do
    customer { nil }
    reservation_time { "2019-07-01 23:29:48" }
    operation_time { "2019-07-01 23:29:48" }
    memo { "MyText" }
    status { false }
  end
end
