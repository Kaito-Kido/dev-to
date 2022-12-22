class HomeController < ApplicationController
  def root_routing
    path = current_user&.admin? ? posts_path : home_index_path
    redirect_to path
  end

  def index
    @pagy, @posts = pagy_countless(Post.published.includes(:user, :reacters), items: 10)

    render partial: "home/scrollable_list" if params[:page]
  end
  
  def search
    case params[:type]    
    when "post"
      if params[:search]
        @pagy, @res = pagy(Post.where('title LIKE ?', "%#{params[:search]}%").includes(:user, :reacters), items: 10)
      else
        @pagy, @res = pagy(Post.all.includes(:user, :reacters), items: 10)
      end
    when "user"
      if params[:search]
        @pagy, @res = pagy(User.where('name LIKE ?', "%#{params[:search]}%"), items: 10)
      else
        @pagy, @res = pagy(User.all, items: 10)
      end
    end
    if params[:order]
      @res = @res.order(created_at: params[:order])
      # respond_to do |format|
      #   format.js
      # end
    end
  end


end
