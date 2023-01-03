class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :authenticate_user!

  def create
    comment = @commentable.comments.new(user_id: current_user.id, content: params[:comment][:content])
    if comment.save
      redirect_to post_path(@commentable)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to post_path(comment.commentable)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.assign_attributes(comment_params)
    if @comment.save
      redirect_to post_path(@commentable) if params[:post_id]
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_commentable
    if params[:comment_id]
      @commentable = Comment.find(params[:comment_id])
    elsif params[:post_id]
      @commentable = Post.find(params[:post_id])
    end
  end

  
end
