class UsersController < ApplicationController
  
  before_action :set_user
  def index
  end

  def show
    @posts = @user.posts.where(status: :published).includes(:user, :reacters)
  end

  def edit

  end

  def update
    @user.assign_attributes(user_params)
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
