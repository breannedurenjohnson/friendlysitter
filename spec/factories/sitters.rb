FactoryBot.define do
  factory :sitter do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    password { "" }
    zipcode { "MyString" }
    image { "" }
    about { "MyString" }
    hourly_rate { 1 }
  end
end
