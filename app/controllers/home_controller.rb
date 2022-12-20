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
      if params[:order]
        @posts = Post.where('title LIKE ?', "%#{params[:search]}%").order(created_at: params[:order]).includes(:user, :reacters)
      else
        @posts = Post.where('title LIKE ?', "%#{params[:search]}%").includes(:user, :reacters)
      end
    else
      if params[:order]
        @posts = Post.all.order(created_at: params[:order]).includes(:user, :reacters)
      else
        @posts = Post.all.includes(:user, :reacters)
      end
    end


  end
end
