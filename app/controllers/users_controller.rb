class UsersController < ApplicationController
  
  before_action :set_user
  def index
  end

  def show
  end

  def edit

  end

  def update
    @user.assign_attributes(user_params)
    if @user.save
      render :edit
    else
      redirect_to user_path
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
