require 'rails_helper'

RSpec.describe "CategoriesControllers", type: :request do
  describe "GET #show" do
    context "signed in" do
      it "should render template :show" do
        user = create(:user)
        sign_in user
        category = create(:category)
        get "/categories/#{category.id}"
        expect(response).to render_template(:show)
      end
    end

    context "logged out" do
      it "should redirect to sign in page" do
        category = create(:category)
        get "/categories/#{category.id}"
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "POST #create" do
    context "logged out" do
      it "should not increase count by 1" do
        expect{ post "/categories", params: {name: "new name", format: :js}}.to change(Category, :count).by(0)
      end
    end

    context "signed in" do
      it "should increase count by 1" do
        user = create(:user)
        sign_in user
        expect{ post "/categories", params: {name: "new name", format: :js}}.to change(Category, :count).by(1)
      end
    end
  end
end
