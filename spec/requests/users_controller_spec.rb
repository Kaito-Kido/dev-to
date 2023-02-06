require 'rails_helper'

def login_user
  @user = create(:user)
  sign_in @user
end


RSpec.describe "UsersControllers", type: :request do
  describe "GET #show" do
    before do
      @user = create(:user)
      get "/users/#{@user.id}"
    end
    it { should render_template(:show) }
    it { expect(response).to have_http_status(:success)}
  end

  describe "PATCH #update" do
    context "signed in" do
      before(:each) do
        login_user
      end
      context "Valid attributes" do
        it "should redirect to user page" do
          patch "/users/#{@user.id}", params: {user: {name: "oke"}}
          @user.reload
          expect(subject).to redirect_to(user_path(@user))
        end
      end

      context "Invalid attributes" do
        it "should re-render to edit user page" do 
          patch "/users/#{@user.id}", params: {user: {name: "", email: ""}}
          @user.reload
          expect(subject).to render_template :edit
        end
      end
    end

    context "logged out" do
      it "should response with Unauthorized" do
        user = create(:user)
        patch "/users/#{user.id}", params: {user: {name: "oke"}}
        expect(response).to have_http_status(401)
      end
    end
  end
end
