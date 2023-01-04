class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :find_comment, except: [:create]
  before_action :find_post, only: [:create, :update]
  before_action :authenticate_user!

  def create
    comment = @commentable.comments.new(user_id: current_user.id, content: params[:comment][:content])
    if comment.save
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    if @comment.destroy
      redirect_to post_path(@post)
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @post_id = @post.id
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

  def find_commentable
    @commentable = 
      if params[:comment_id]
        Comment.find(params[:comment_id])
      elsif params[:post_id]
        Post.find(params[:post_id])
      end
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_post
    @post = params[:post_id] ? Post.find(params[:post_id]) : Post.find(params[:comment][:post_id])
  end
  
end
