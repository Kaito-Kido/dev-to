
class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :archive]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    if current_user.admin?
      @posts = Post.pending
    else
      @posts = current_user.posts.where.not(status: :published)
    end
  end

  def new
    @post = Post.create(status: :draft, user_id: current_user.id)
    redirect_to edit_post_path(@post)
  end

  def edit
    render layout: "without_create_post" 
  end


  def destroy
    if @post.destroy
      redirect_to user_path(current_user)
    end
  end


  def update
    case params[:status]
    when "pending"
      @post.status = :pending
      @post.assign_attributes(post_params)
    when "published"
      @post.status = params[:status]
    when "declined"
      @post.status = params[:status]
    else
      @post.status = :draft
      @post.assign_attributes(post_params)
    end
    if @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  


  def show
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
