FactoryBot.define do
  factory :stylists_menu, class: 'Stylists::Menu' do
    association :customer
    name { "MyString" }
    price { 5980 }
    operation_time { 60 }
    content { "MyString" }
    sales_copy { "MyString" }
    memo { "MyString" }
  end
end
