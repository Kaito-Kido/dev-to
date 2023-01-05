class FollowsController < ApplicationController
  def create
    return if following?(params[:user_id])
    @follow = Follow.new(follower_id: current_user.id, followed_id: params[:user_id])
    # If haven't followed yet 
    if @follow.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @follow = Follow.find_by(follower_id: current_user.id, followed_id: params[:user_id])
    if @follow.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private
  # Check if current user is following this user or not
  def following?(id)
    return true if Follow.find_by(follower_id: current_user.id, followed_id: id).present?
    false
  end
end
