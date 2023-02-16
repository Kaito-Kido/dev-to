require 'rails_helper'

RSpec.describe 'ReactsControllers', type: :request do
  describe 'POST #create' do
    context 'siged in' do
      before(:each) do
        @user = create(:user)
        sign_in @user
      end

      context 'for post' do
        it 'should increase count by 1' do
          post = create(:post, user: @user)
          expect { post "/posts/#{post.id}/react", params: { format: :js } }.to change(React, :count).by(1)
        end
      end

      context 'for comment' do
        it 'should increase count by 1' do
          post = create(:post, user: @user)
          comment = create(:comment, user: @user, post_id: post.id)
          expect { post "/comments/#{comment.id}/react", params: { format: :js } }.to change(React, :count).by(1)
        end
      end
    end

    context 'logged out' do
      before(:each) do
        @user = create(:user)
        @post = create(:post, user: @user)
        @comment = create(:comment, user: @user, post_id: @post.id)
      end

      context 'for post' do
        it 'should redirect to sign in page' do
          post "/posts/#{@post.id}/react", params: { format: :js }
          expect(response).to have_http_status(401)
        end
      end

      context 'for comment' do
        it 'should redirect to sign in page' do
          post "/comments/#{@comment.id}/react", params: { format: :js }
          expect(response).to have_http_status(401)
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'signed in' do
      before(:each) do
        @user = create(:user)
        sign_in @user
        @post = create(:post, user: @user)
        @comment = create(:comment, user: @user, post_id: @post.id)
      end
      context 'for post' do
        it 'decrease count by 1' do
          create(:react, user: @user, reactable: @post, post_id: @post.id)
          expect { delete "/posts/#{@post.id}/react", params: { format: :js } }.to change(React, :count).by(-1)
        end
      end

      context 'for comment' do
        it 'decrease count by 1' do
          create(:react, user: @user, reactable: @comment, post_id: @post.id)
          expect { delete "/comments/#{@comment.id}/react", params: { format: :js } }.to change(React, :count).by(-1)
        end
      end
    end

    context 'logged out' do
      before(:each) do
        @user = create(:user)
        @post = create(:post, user: @user)
        @comment = create(:comment, user: @user, post_id: @post.id)
      end
      context 'for post' do
        it 'should redirect to sign in page' do
          post "/posts/#{@post.id}/react", params: { format: :js }
          expect(response).to have_http_status(401)
        end
      end

      context 'for comment' do
        it 'should redirect to sign in page' do
          post "/comments/#{@comment.id}/react", params: { format: :js }
          expect(response).to have_http_status(401)
        end
      end
    end
  end
end
