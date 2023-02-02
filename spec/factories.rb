require 'open-uri'
FactoryBot.define do
  factory :user do
    name {"Ben10"}
    sequence(:email) { |n| "test-#{n}@example.com" }
    password {"mailam123"}
    role {"user"}
    after(:build) do |user|
      user.avatar.attach(
        io: URI.parse("https://avatars.dicebear.com/api/adventurer-neutral/test.svg").open,
        filename: "test"
      )
    end
  end

  factory :post do
    association :user
    title {"Untitled"}
    content {nil}
    status {:draft}
  end
end
