class UsersController < ApplicationController
  def index
  end



  def show
    @user = User.includes(:posts).find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = find_user
  end

  def update
    @user = find_user
    unless @user.update(user_params)
      render :edit
    else
      redirect_to user_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :avatar)
    end

    def find_user
      return User.find(params[:id])
    end
  
end
