class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :find_post, only: [:create, :update]
  before_action :authenticate_user!

  def create
    comment = @commentable.comments.new(user_id: current_user.id, content: params[:comment][:content])
    if comment.save
      redirect_to post_path(@post)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    if params[:postId]
      post = Post.find(params[:postId])
    elsif params[:post_id]
      post = Post.find(params[:post_id])
    end
    redirect_to post_path(post)
  end

  def edit
    if params[:postId]
      @postId = params[:postId]
    elsif params[:post_id]
      @postId = Post.find(params[:post_id]).id
    end
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.assign_attributes(comment_params)
    if @comment.save
      redirect_to post_path(@post)
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

  def find_post
    if params[:post_id]
      @post = Post.find(params[:post_id])
    elsif params[:comment][:postId]
      @post = Post.find(params[:comment][:postId])
    end
  end
  
end
