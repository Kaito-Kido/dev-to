class HomeController < ApplicationController
  def root_routing
    path = current_user&.admin? ? posts_path : home_index_path
    redirect_to path
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
