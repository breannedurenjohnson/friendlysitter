FactoryBot.define do
  factory :parent do
    first_name { "Breanne" }
    last_name { "Johnson" }
    email { "breanne@gmail.com" }
    password { "12345678" }
    city { "Minneapolis" }
    state { "MN" }
  end
end
