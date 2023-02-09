class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:create, :destroy]
  def index
    @pagy, @bookmark_posts = pagy(current_user.bookmark_posts.includes({user: {avatar_attachment: :blob}}, :categories), items: 10)
  end

  def create
    bookmark = Bookmark.where(user: current_user, post: @post).first_or_initialize
    if bookmark.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    bookmark = Bookmark.find_by(post: @post, user: current_user)
    if bookmark&.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end
end
