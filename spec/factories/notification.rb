FactoryBot.define do
  factory :notification do
    sender_id { 1 }
    receiver_id { 2 }
    content { Faker::Lorem.sentence }
    action { 'post' }
    seen { false }
  end
end
