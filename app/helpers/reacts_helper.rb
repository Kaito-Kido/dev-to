module ReactsHelper
  def reacted?(post)
    if user_signed_in?
      # React.where(post: post, user: current_user).exists?
      post.reacters.include?(current_user)
    end
  end
end
