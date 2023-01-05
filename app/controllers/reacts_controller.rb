class ReactsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_reactable

  def create
    #If reactable was reacted, do not do anything 
    @react = @reactable.reacts.where(user_id: current_user.id).first_or_initialize
    if @react.save
      respond_to do |format|
        format.js 
      end
    end
  end

  def destroy
    #If reactable is reacted, destroy it
    @react = @reactable.reacts.find_by(user_id: current_user.id)
    if @react&.destroy
      respond_to do |format|
        format.js {
        }
      end
    end
  end

  private
  #Find reactable by params in url
  def find_reactable
    @reactable =
      if params[:post_id]
        Post.find(params[:post_id])
      elsif params[:comment_id]
        Comment.find(params[:comment_id])
      end
  end
end
