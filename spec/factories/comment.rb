FactoryBot.define do
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
end
