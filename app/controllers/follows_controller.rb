class FollowsController < ApplicationController
  before_action :authenticate_user!
  def create
    @follow = Follow.where(follower_id: current_user.id, followed_id: params[:user_id]).first_or_initialize
    if @follow.save
      CreateNotificationJob.perform_later(sender: current_user, receiver_id: params[:user_id], action: "follow")
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @follow = Follow.find_by(follower_id: current_user.id, followed_id: params[:user_id])
    if @follow&.destroy
      respond_to do |format|
        format.js
      end
    end
  end
end
