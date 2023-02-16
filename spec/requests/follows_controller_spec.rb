require 'rails_helper'

def login_user
  @user = create(:user)
  sign_in @user
end

RSpec.describe 'FollowsControllers', type: :request do
  context 'signed in' do
    before(:each) do
      login_user
      @friend = create(:user)
    end
    describe 'POST #create' do
      it 'should increase count by 1' do
        expect { post "/users/#{@friend.id}/follow", params: { format: :js } }.to change(Follow, :count).by(1)
      end
    end

    describe 'DELETE #destroy' do
      it 'should decrease count by 1' do
        create(:follow, follower_id: @user.id, followed_id: @friend.id)
        expect { delete "/users/#{@friend.id}/follow", params: { format: :js } }.to change(Follow, :count).by(-1)
      end
    end
  end

  context 'logged out' do
    before(:each) do
      @user = create(:user)
      @friend = create(:user)
    end
    describe 'POST #create' do
      it 'should not increase count by 1' do
        expect { post "/users/#{@friend.id}/follow", params: { format: :js } }.to change(Follow, :count).by(0)
        expect(response).to have_http_status(401)
      end
    end

    describe 'DELETE #destroy' do
      it 'should not decrease count by 1' do
        create(:follow, follower_id: @user.id, followed_id: @friend.id)
        expect { delete "/users/#{@friend.id}/follow", params: { format: :js } }.to change(Follow, :count).by(0)
        expect(response).to have_http_status(401)
      end
    end
  end
end
