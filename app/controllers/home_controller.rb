class HomeController < ApplicationController
  def root_routing
    if user_signed_in?
      path = case current_user.role
      when 'admin'
        dashboard_path
      else
        home_index_path
      end

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
      @posts = Post.where('title LIKE ?', "%#{params[:search]}%")
    else
      @posts = Post.all
    end

  end
end
