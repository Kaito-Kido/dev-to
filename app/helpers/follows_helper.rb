module FollowsHelper
  def following?(user_id)
    return true if Follow.find_by(follower_id: current_user.id, followed_id: user_id).present?
    false
  end
end
