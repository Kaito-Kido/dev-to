require 'rails_helper'

def login_user
  @user = create(:user)
  sign_in @user
end

RSpec.describe "CommentsControllers", type: :request do
  describe "POST #create" do
    before(:each) do
      login_user
      @post = create(:post, user: @user)
    end
    
    context "belong to post" do
      it "should save to db" do
        expect{create(:comment, :for_post, post_id: @post.id, user: @user)}.to change(Comment, :count).by(1)
      end

      it "should redirect to post_path" do
        post "/posts/#{@post.id}/comments", params: {comment: {content: "content"}}
        expect(response).to redirect_to(post_path(@post))
      end
    end

    context "belong to comment" do
      it "should save to db" do
        comment = create(:comment, :for_post, post_id: @post.id, user: @user)
        expect{create(:comment, :for_comment, post_id: @post.id, user: @user, commentable: comment)}.to change(Comment, :count).by(1)
      end

      it "should redirect to post_path" do
        comment = create(:comment, :for_post, post_id: @post.id, user: @user)
        post "/comments/#{comment.id}/comments", params: {comment: {content: "content"}, post_id: @post.id}
        expect(response).to redirect_to(post_path(@post))
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      login_user
      @post = create(:post, user: @user)
    end

    context "belong to post" do
      it "should detele the comment" do
        comment = create(:comment, :for_post, post_id: @post.id, user: @user)
        expect{delete "/comments/#{comment.id}", params: {format: :js}}.to change(Comment, :count).by(-1)
      end
    end

    context "belong to comment" do
      it "should detele the comment" do
        comment = create(:comment, :for_post, post_id: @post.id)
        reply_comment = create(:comment, :for_comment, post_id: @post.id, user: @user, commentable: comment)
        expect{delete "/comments/#{reply_comment.commentable.id}/comments/#{reply_comment.id}", params: {format: :js}}.to change(Comment, :count).by(-1)
      end
    end
  end

  describe "GET #edit" do
    before(:each) do 
      login_user
      @post = create(:post, user: @user)
    end

    context "belong to post" do
      it "should render template :edit" do
        comment = create(:comment, :for_post, post_id: @post.id, user: @user)
        get "/comments/#{comment.id}/edit"
        expect(response).to render_template(:edit)
        expect(response).to have_http_status(:ok)
      end
    end

    context "belong to comment" do
      it "should render template :edit" do
        comment = create(:comment, :for_post, post_id: @post.id, user: @user)
        reply_comment = create(:comment, :for_comment, post_id: @post.id, user: @user,  commentable: comment)
        get "/comments/#{reply_comment.commentable.id}/comments/#{reply_comment.id}/edit"
        expect(response).to render_template(:edit)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
