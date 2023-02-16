require 'rails_helper'

RSpec.describe 'HomeControllers', type: :request do
  describe 'GET /index' do
    it 'should render template :index' do
      get '/home/index'
      expect(response).to render_template(:index)
    end
  end
end
