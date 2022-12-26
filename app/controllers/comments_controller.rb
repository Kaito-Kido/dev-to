class CommentsController < ApplicationController
  before_action :find_comment, only: [:update, :edit, :destroy]
  before_action :authenticate_user!
  before_action :require_name
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(post_id: @post.id, user_id: current_user.id, content: params[:comment][:content])
    if @comment.save
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  def edit
  end

  def update
    @comment.assign_attributes(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def require_name
    if current_user.name.nil? || current_user.name.blank?
      redirect_to user_path(current_user)
    end
  end

  
end
