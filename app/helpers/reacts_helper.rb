module ReactsHelper
  def reacted?(post)
    if user_signed_in?
      post.reacters.include?(current_user)
    end
  end
end
