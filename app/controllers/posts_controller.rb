
class PostsController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.all, items: 10)
  end
end
