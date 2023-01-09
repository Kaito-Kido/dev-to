class UsersController < ApplicationController
  
  before_action :set_user, except: [:root_routing]


  def index
  end

  def show
    @posts = @user.posts.published.includes(:user, :reacters)
    if params[:notification_id]
      notification = Notification.find(params[:notification_id])
      notification.status = :readed
      notification.save
    end
  end

  def edit

  end

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
    params.require(:user).permit(:name, :email, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
  
end
