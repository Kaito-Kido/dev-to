class CommentsController < ApplicationController
  before_action :find_comment, only: [:update, :edit, :destroy]
  before_action :require_sign_in
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
    @comment = Comment.find(params[:id])
  end

  def require_sign_in
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
end
