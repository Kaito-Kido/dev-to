FactoryBot.define do
  factory :post do
    association :user
    title { 'Untitled' }
    content { nil }
    status { :draft }
  end
end
