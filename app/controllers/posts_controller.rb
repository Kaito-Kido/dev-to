
class PostsController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.includes(:user).all, items: 10)
  end
end
