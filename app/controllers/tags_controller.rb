class TagsController < ApplicationController
  before_action :authenticate_user!
  def create
    @tag = Tag.new(post_id: params[:post_id], category_id: params[:category_id])
    return unless @tag.save

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @tag = Tag.find_by(post_id: params[:post_id], category_id: params[:category_id])
    return unless @tag.destroy

    respond_to do |format|
      format.js
    end
  end
end
