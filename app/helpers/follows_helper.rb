module FollowsHelper
  def following?(user_id)
    Follow.find_by(follower_id: current_user.id, followed_id: user_id).present?
  end
end
