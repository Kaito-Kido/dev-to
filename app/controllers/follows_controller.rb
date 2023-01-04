class FollowsController < ApplicationController
  def create
    @follow = Follow.new(follower_id: current_user.id, followed_id: params[:user_id])
    if !following?(params[:user_id]) && @follow.save
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
  def following?(id)
    return true if Follow.find_by(follower_id: current_user.id, followed_id: id).present?
    false
  end
end
