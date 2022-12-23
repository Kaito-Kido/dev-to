
class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :archive]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    if current_user.admin?
      if params[:type] == "user"
        if params[:most]
          @pagy, @res = pagy_countless(User.joins(:posts).distinct.select('users.*, COUNT(posts.reacts_count) AS user_reacts_count').group('id').order(user_reacts_count: :desc), items: 10)
        else
          @pagy, @res = pagy_countless(User.all, items:10)
        end
      else
        if params[:most]
          @pagy, @res = pagy_countless(Post.published.order(reacts_count: :desc), items: 10)
        elsif params[:status].present? && Post.statuses.keys.include?(params[:status])
          @pagy, @res = pagy_countless(Post.send(params[:status]), items:10)
        else
          @pagy, @res = pagy_countless(Post.all, items:10)
        end
      end
    else
      if params[:most]
        @pagy, @posts = pagy_countless(current_user.posts.published.order(reacts_count: :desc), items: 10)
      elsif params[:status].present? && Post.statuses.keys.include?(params[:status])
        @pagy, @posts = pagy_countless(current_user.posts.send(params[:status]), items:10)
      else
        @pagy, @posts = pagy_countless(current_user.posts, items:10)
      end
    end
  end

  def new
    @post = Post.create(title: "Untitled", status: :draft, user_id: current_user.id)
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
      if Post.find(params[:id]).user.admin?
        @post.assign_attributes(post_params)
      end
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
