require 'open-uri'
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Ben#{n}" }
    sequence(:email) { |n| "test-#{n}@example.com" }
    password { 'mailam123' }
    role { 'user' }
    after(:build) do |user|
      user.avatar.attach(
        io: URI.parse('https://avatars.dicebear.com/api/adventurer-neutral/test.svg').open,
        filename: 'test'
      )
    end
  end
end
