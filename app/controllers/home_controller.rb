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
