require 'rails_helper'

RSpec.describe "Bookmarks", type: :request do
  describe "GET #index" do
    before(:each) do
      @user = create(:user)
    end

    context "logged out" do
      it "should redirect to sign in page" do
        get "/users/#{@user.id}/bookmarks"
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "signed in" do
      it "should render template index" do
        sign_in @user
        get "/users/#{@user.id}/bookmarks"
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:index)
      end
    end
  end

  describe "POST #create" do
    before(:each) do
      @user = create(:user)
      @post = create(:post)
    end

    context "logged out" do
      it "should redirect to sign in page" do
        post "/posts/#{@post.id}/bookmark"
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "signed in" do
      it "should increase count by 1" do
        sign_in @user
        expect{ post "/posts/#{@post.id}/bookmark", params: {format: :js} }.to change(Bookmark, :count).by(1)
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @user = create(:user)
      @post = create(:post)
    end

    context "logged out" do
      it "it should redirect to sign in page" do
        delete "/posts/#{@post.id}/bookmark"
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "signed in" do
      it "should decrease count by -1" do
        sign_in @user
        bookmark = create(:bookmark, user: @user, post: @post)
        expect{ delete "/posts/#{@post.id}/bookmark", params: {format: :js} }.to change(Bookmark, :count).by(-1)
      end
    end
  end
end
