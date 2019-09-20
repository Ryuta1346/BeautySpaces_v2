FactoryBot.define do
  factory :reservation do
    association :salons_reservation
    association :stylists_reservation
    association :stylists_menu
    association :customer
    memo { "MyText" }
    status { false }
  end
end
