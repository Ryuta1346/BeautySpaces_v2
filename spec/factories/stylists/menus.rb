FactoryBot.define do
  factory :stylists_menu, class: 'Stylists::Menu' do
    customer { nil }
    name { "MyString" }
    price { 1 }
    operation_time { 1 }
    content { "MyString" }
    sales_copy { "MyString" }
    memo { "MyString" }
  end
end
