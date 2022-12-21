class ReactsController < ApplicationController
  before_action :authenticate_user!

  def create
    return if reacted?(params[:post_id])

    @react = React.new(user_id: current_user.id, post_id: params[:post_id])
    respond_to do |format|
      if @react.save
        format.js 
      end
    end
  end

  def destroy
    if reacted?(params[:post_id])
      @react = React.find_by(post_id: params[:post_id], user_id: current_user.id)
      respond_to do |format|
        if @react.destroy
          format.js {
          }
        end
      end
    end
  end

  private
  def reacted?(post)
      React.find_by(post: post, user: current_user).present?
  end



end
