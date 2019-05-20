FactoryBot.define do
  factory :salon do
    category { nil }
    prefecture { nil }
    name { "MyString" }
    place { "MyString" }
    tel { "MyString" }
    email { "MyString" }
    features { "MyString" }
    num_of_stylists { 1 }
    num_of_sheets { 1 }
    opening_time { "2019-05-20" }
    closing_time { "2019-05-20" }
  end
end
