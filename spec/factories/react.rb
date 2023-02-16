FactoryBot.define do
  factory :react do
    association :user
    trait :for_post do
      association :reactable, factory: :post
    end

    trait :for_comment do
      association :reactable, factory: :comment
    end
  end
end
