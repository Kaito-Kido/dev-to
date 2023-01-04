module ReactsHelper
  def reacted?(post)
    if user_signed_in?
      post.reacts.find_by(user_id: current_user.id).present?
    end
  end

  def is_post?(reactable)
    true if reactable.class.name == "Post"
  end
end
