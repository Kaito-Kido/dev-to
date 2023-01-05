class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: :follower_id, class_name: User.name

  belongs_to :followed_user, foreign_key: :followed_id, class_name: User.name
end
