
class PostsController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.all.includes(:user), items: 10)
  end
end
