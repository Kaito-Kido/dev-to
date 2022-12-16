
class PostsController < ApplicationController
  before_action :set_post, except: [:index]
  def index
    @pagy, @posts = pagy(Post.all.includes(:user, :reacters), items: 10)
  end

  def show
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
end
