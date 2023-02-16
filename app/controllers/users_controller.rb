class UsersController < ApplicationController
  before_action :set_user, except: [:root_routing]
  before_action :authenticate_user!, except: [:show]

  def index; end

  def show
    @posts = @user.posts.published.includes(:categories)
    return unless params[:notification_id]

    notification = Notification.find(params[:notification_id])
    notification.seen = true
    notification.save
  end

  def edit; end

  def update
    @user.assign_attributes(user_params)
    @user.avatar.attach(params[:user][:avatar]) if params[:user][:avatar].present?
    if @user.save
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :bio, :location, :education, :work)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
