class ReactsController < ApplicationController
  before_action :authenticate_user!

  def create
    return if reacted?(params[:post_id])

    @react = React.new(user_id: current_user.id, post_id: params[:post_id])
    @react.save
  end

  def destroy
    if reacted?(params[:post_id])
      react = React.find_by(post_id: params[:post_id], user_id: current_user.id)
      react.destroy
    end
  end

  private
  def reacted?(post)
      React.find_by(post: post, user: current_user).present?
  end



end
