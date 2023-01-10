class CategoriesController < ApplicationController

  def show
    @posts = Category.find(params[:id]).posts.includes(:categories, {user: {avatar_attachment: :blob}})
  end

  def create
    category = Category.where(name: params[:category_name]).first_or_initialize
    if category.save
      Tag.create(post_id: params[:post_id], category_id: category.id)
      respond_to do |format|
        format.js
      end
    end
  end
end
