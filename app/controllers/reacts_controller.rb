class ReactsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_reactable
  before_action :find_post

  def create
    #If reactable was reacted, do not do anything 
    @react = @reactable.reacts.where(user_id: current_user.id, post_id: @post.id).first_or_initialize
    if @react.save
      if @post.user.id != current_user
        CreateNotificationJob.perform_later(sender: current_user, reactable: @reactable, post: @post, action: "like")
        respond_to do |format|
          format.js 
        end
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

  def find_post
    post_id = @reactable.class.name == "Post" ? @reactable.id : @reactable.post_id
    @post = Post.find(post_id)
  end
end
