require 'rails_helper'

RSpec.describe 'NotificationsControllers', type: :request do
  describe 'GET /index' do
    context 'singed in' do
      it 'should render template :index' do
        user = create(:user)
        sign_in user
        get '/notifications'
        expect(response).to render_template(:index)
      end
    end

    context 'logged out' do
      it 'should redirect to sign in page' do
        get '/notifications'
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
