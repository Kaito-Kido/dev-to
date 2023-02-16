class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def show
    @category = Category.find(params[:id])
    @pagy, @posts = pagy(@category.posts.includes(:categories, { user: { avatar_attachment: :blob } }), items: 10)

    render partial: 'home/scrollable_list' if params[:page]
  end

  def create
    category = Category.where(name: params[:category_name]).first_or_initialize
    return unless category.save

    Tag.create(post_id: params[:post_id], category_id: category.id)
    respond_to do |format|
      format.js
    end
  end
end
