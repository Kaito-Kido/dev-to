FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Ruby #{n}" }
  end
end
