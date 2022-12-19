
class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :archive]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @pagy, @posts = pagy(Post.published.includes(:user, :reacters), items: 10)
  end

  def new
    @post = Post.create(status: :draft, user_id: current_user.id)
    redirect_to edit_post_path(@post)
  end

  def edit
    render layout: "without_create_post" 
  end

  def archive
    @posts = current_user.posts.draft.or(current_user.posts.pending).or(current_user.posts.declined)
    @pending_posts = Post.pending
  end

  def destroy
    if @post.destroy
      redirect_to user_path(current_user)
    end
  end


  def update
    if params[:status] == "published" || params[:status] == "declined"
      @post.status = params[:status]
    else
      @post.assign_attributes(post_params)
      if params[:status] == "pending"
        @post.status = :pending
      else
        @post.status = :draft
      end
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
