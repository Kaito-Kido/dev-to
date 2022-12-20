class HomeController < ApplicationController
  def root_routing
    if user_signed_in?
      path = path = current_user&.admin? ? posts_path : home_index_path
      redirect_to path
    else
      redirect_to home_index_path
    end
  end

  def index
    @pagy, @posts = pagy(Post.published.includes(:user, :reacters), items: 10)
  end

  def search
    if params[:search]
      @posts = Post.where('title LIKE ?', "%#{params[:search]}%").includes(:user, :reacters)
    else
      @posts = Post.all.includes(:user, :reacters)
    end

  end
end
