class HomeController < ApplicationController
  def root_routing
    path = current_user&.admin? ? posts_path : home_index_path
    redirect_to path
  end

  def index
    posts = Post.published.includes({ user: { avatar_attachment: :blob } }, :categories)
    @pagy, @posts = pagy_countless(posts, items: 10)

    render partial: 'home/scrollable_list' if params[:page]
  end

  def search
    case params[:type]
    when 'post'
      if params[:search]
        @pagy, @res = pagy(
          Post.joins(tags: :category).where('name LIKE ?', "%#{Category.sanitize_sql_like(params[:search])}%").or(Post.joins(tags: :category).where('title LIKE ?', "%#{Post.sanitize_sql_like(params[:search])}%")).includes(
            { user: { avatar_attachment: :blob } }, :categories
          ), items: 10
        )
      else
        @pagy, @res = pagy(Post.all.includes(user: { avatar_attachment: :blob }), items: 10)
      end

      render partial: 'home/scrollable_post_search_list' if params[:page]
    when 'user'
      if params[:search]
        @pagy, @res = pagy(
          User.where('name LIKE ?',
                     "%#{User.sanitize_sql_like(params[:search])}%").includes(avatar_attachment: :blob), items: 10
        )
      else
        @pagy, @res = pagy(User.all.includes(avatar_attachmetn: :blob), items: 10)
      end

      render partial: 'home/scrollable_user_search_list' if params[:page]
    end

    return unless params[:order]

    @res = @res.order(created_at: params[:order])
  end
end
