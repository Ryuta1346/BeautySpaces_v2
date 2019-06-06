FactoryBot.define do
  factory :customer do
    type { "" }
    name { "MyString" }
    tel { "MyString" }
    prefecure { nil }
    category { nil }
    birth_of_year { 1 }
    activity_scope { "MyString" }
    features { "MyString" }
    num_of_sheets { 1 }
    opening_time { "2019-06-07 00:18:31" }
    ending_time { "2019-06-07 00:18:31" }
    since { 1 }
  end
end
