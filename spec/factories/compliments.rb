FactoryBot.define do
  factory :compliment do
    content { "MyString" }
    parent { nil }
    sitter { nil }
  end
end
