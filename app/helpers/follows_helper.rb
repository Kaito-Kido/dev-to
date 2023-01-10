module FollowsHelper
  def following?(user_id)
    Follow.find_by(follower_id: current_user.id, followed_id: user_id).present? if user_signed_in?
  end
end
