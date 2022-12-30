class CategoriesController < ApplicationController

  def show
    @posts = Category.find(params[:id]).posts
  end

  def create
    category = Category.new(name: params[:category_name])
    if Category.find_by(name: params[:category_name]).nil? && category.save
      Tag.create(post_id: params[:post_id], category_id: category.id)
      respond_to do |format|
        format.js
      end
    end
  end
end
