require 'open-uri'
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Ben#{n}"}
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

  factory :comment do
    association :user

    for_post

    trait :for_post do
      association :commentable, factory: :post
    end

    trait :for_comment do
      association :commentable, factory: :comment
    end
    content { Faker::Lorem.sentence }
    post_id { 1 }
  end

  factory :follow do
    follower_id {1}
    followed_id {2}
  end

  factory :react do
    association :user
    trait :for_post do
      association :reactable, factory: :post
    end

    trait :for_comment do
      association :reactable, factory: :comment
    end
  end

  factory :category do
    sequence(:name) { |n| "Ruby #{n}"}
  end

  factory :tag do
    association :category
    association :post
  end
end
