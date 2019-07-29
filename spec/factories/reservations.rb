FactoryBot.define do
  factory :reservation do
    salons_reservation_id { 1 }
    stylists_reservation_id { 1 }
    stylists_menu_id { 1 }
    customer { nil }
    memo { "MyText" }
    status { false }
  end
end
