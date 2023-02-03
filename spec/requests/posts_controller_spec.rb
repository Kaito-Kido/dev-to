require 'rails_helper'

def login_user
  @user = create(:user)
  sign_in @user
end

RSpec.describe "PostsControllers", type: :request do
  describe "GET #index" do
    context 'when user is logged in' do
      before do 
        login_user
        get '/posts'
      end
      it { expect(response).to have_http_status(:success)}
      it { should render_template :index }

    end
    context 'when user is logged out' do
      before { get '/posts' }
      it { should redirect_to new_user_session_path }
      it { expect(response).to have_http_status(:redirect)}
    end
  end

  describe "GET #new" do
    it "should redirect to edit page" do
      login_user
      #goi thang nay no tu tao mot post nen em goi Post.last
      get '/posts/new'
      @post = Post.last
      expect(response).to redirect_to(edit_post_path(@post))
      expect(response).to have_http_status(:redirect)
    end

    it "should create new post" do
      login_user
      expect { create(:post, user: @user) }.to change(Post, :count).by(1)
    end

    it "should checks that a song can be created" do
      login_user
      post = create(:post, user: @user)
      expect(post).to be_valid
    end
  end

  describe "GET #edit" do
    it "should render template :edit" do 
      login_user
      @post = create(:post, user: @user)
      get "/posts/#{@post.id}/edit"
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #show" do
    it "should render posts#show template"do
    user = create(:user)
    post = create(:post, user: user)
    visit post_path(post)
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.content)
    end
  end

  describe "PATCH #update" do
    before :each do
      login_user
      @post = create(:post, user: @user)
    end

    context "valid attributes" do
      it "changes @post's attributes" do
        patch "/posts/#{@post.id}", params: {post: {title: "change title"}, format: :js}
        @post.reload
        expect(@post.title).to eq("change title")
        expect(response).to have_http_status(:ok)
      end
    end

    context "invalid attributes" do
      it "does not change @post's attributes" do
        patch "/posts/#{@post.id}", params: {post: {title: ""}, format: :js}
        @post.reload
        expect(@post.title).not_to eq("")
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      login_user
      @post = create(:post, user: @user)
    end

    it "deletes the post" do
      expect{delete "/posts/#{@post.id}"}.to change(Post, :count).by(-1)
    end

    it "redirects to current user" do
      delete "/posts/#{@post.id}"
      expect(subject).to redirect_to(user_path(@user))
    end
  end
end
