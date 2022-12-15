class ReactsController < ApplicationController
  before_action :require_sign_in

  def create
    unless reacted?(params[:post_id])
      @react = React.new(user_id: current_user.id, post_id: params[:post_id])
      @react.save
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    if @post.reacts.where(params[:id]).exists?
      @react = @post.reacts.find(params[:id])
      @react.destroy
    end
  end

  private
  def reacted?(post_id)
      React.where(post_id: post_id, user_id: current_user.id).exists?
  end

  def require_sign_in
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end


end
