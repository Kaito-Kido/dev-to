require 'rails_helper'

RSpec.describe "TagsControllers", type: :request do
  before(:each) do
    @user = create(:user)
    @post = create(:post, user: @user)
    @category = create(:category)
  end
  describe "POST #create" do
    it "should increase count by 1" do
      expect{ post "/posts/#{@post.id}/tags", params: {category_id: @category.id, format: :js} }.to change(Tag, :count).by(1)
    end
  end

  describe "DELETE #destroy" do
    it "should decrease count by 1" do
      tag = create(:tag, post: @post, category: @category)
      expect{ delete "/posts/#{@post.id}/tags/#{tag.id}", params: {category_id: @category.id, format: :js}}.to change(Tag, :count).by(-1)
    end
  end
end
