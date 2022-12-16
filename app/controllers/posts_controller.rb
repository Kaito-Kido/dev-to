
class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :archive]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @pagy, @posts = pagy(Post.where(status: :published).includes(:user, :reacters), items: 10)
  end

  def new
    @post = Post.create(status: :draft, user_id: current_user.id)
    redirect_to edit_post_path(@post)
  end

  def edit
    render layout: "new_post" 
  end

  def archive
    @posts = current_user.posts.where(status: :draft).or(current_user.posts.where(status: :pending))
  end

  def destroy
    if @post.destroy
      redirect_to user_path(current_user)
    end
  end


  def update
    @post.assign_attributes(post_params)
    @post.status = params[:status]
    if @post.save!
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  


  def show
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :status)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
