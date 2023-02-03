require 'rails_helper'

RSpec.describe "CategoriesControllers", type: :request do
  describe "GET #show" do
    it "should render template :show" do
      category = create(:category)
      get "/categories/#{category.id}"
      expect(response).to render_template(:show)
    end
  end

  describe "POST #create" do
    it "should increate count by 1" do
      expect{ post "/categories", params: {name: "new name", format: :js}}.to change(Category, :count).by(1)
    end
  end
end
