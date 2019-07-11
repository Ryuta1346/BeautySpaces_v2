FactoryBot.define do
  factory :stylists_reservation, class: 'Stylists::Reservation' do
    customer { nil }
    reservation_time { "2019-07-02 20:45:05" }
    operation_time { 60 }
    activity_scope { "MyString" }
    memo { "MyText" }
    status { false }
  end
end
