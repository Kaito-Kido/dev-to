require 'rails_helper'

RSpec.describe 'TagsControllers', type: :request do
  context 'signed in' do
    before(:each) do
      @user = create(:user)
      sign_in @user
      @post = create(:post, user: @user)
      @category = create(:category)
    end
    describe 'POST #create' do
      it 'should increase count by 1' do
        expect do
          post "/posts/#{@post.id}/tags", params: { category_id: @category.id, format: :js }
        end.to change(Tag, :count).by(1)
      end
    end

    describe 'DELETE #destroy' do
      it 'should decrease count by 1' do
        tag = create(:tag, post: @post, category: @category)
        expect do
          delete "/posts/#{@post.id}/tags/#{tag.id}",
                 params: { category_id: @category.id, format: :js }
        end.to change(Tag, :count).by(-1)
      end
    end
  end

  context 'logged out' do
    it 'response with Unauthorized' do
      user = create(:user)
      post = create(:post, user: user)
      category = create(:category)
      tag = create(:tag, post: post, category: category)
      post "/posts/#{post.id}/tags", params: { category_id: category.id, format: :js }
      expect(response).to have_http_status(401)
      delete "/posts/#{post.id}/tags/#{tag.id}", params: { category_id: category.id, format: :js }
      expect(response).to have_http_status(401)
    end
  end
end
