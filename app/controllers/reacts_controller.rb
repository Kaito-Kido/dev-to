class ReactsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_reactable

  def create
    return if reacted?(@reactable)

    @react = @reactable.reacts.new(user_id: current_user.id)
    @react.save
    respond_to do |format|
      format.js 
    end
  end

  def destroy
    if reacted?(@reactable)
      @react = @reactable.reacts.find_by(user_id: current_user.id)
      if @react.destroy
        respond_to do |format|
          format.js {
          }
        end
      end
    end
  end

  private
  def reacted?(reactable)
      reactable.reacts.find_by(user: current_user).present?
  end

  def find_reactable
    @reactable =
      if params[:post_id]
        Post.find(params[:post_id])
      elsif params[:comment_id]
        Comment.find(params[:comment_id])
      end
  end



end
