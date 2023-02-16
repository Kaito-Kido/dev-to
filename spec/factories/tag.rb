FactoryBot.define do
  factory :tag do
    association :category
    association :post
  end
end
