class ReactsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_reactable

  def create
    #If reactable was reacted, do not do anything 
    return if reacted?(@reactable)

    @react = @reactable.reacts.new(user_id: current_user.id)
    if @react.save
      respond_to do |format|
        format.js 
      end
    end
  end

  def destroy
    #If reactable is reacted, destroy it
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
  # Check if a reactable is reacted or not
  def reacted?(reactable)
      reactable.reacts.find_by(user: current_user).present?
  end

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
