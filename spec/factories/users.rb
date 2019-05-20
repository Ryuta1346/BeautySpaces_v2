FactoryBot.define do
  factory :user do
    name { "MyString" }
    tel { "MyString" }
    email { "MyString" }
    prefecture { nil }
    place { "MyString" }
    birth_of_year { 1 }
  end
end
