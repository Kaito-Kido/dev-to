module ReactsHelper
  def reacted?(post_id)
    if user_signed_in?
      React.where(post_id: post_id, user_id: current_user.id).exists?
    end
  end

  def find_react_id(post_id)
    React.where(post_id: post_id, user_id: current_user.id).ids
  end
end
