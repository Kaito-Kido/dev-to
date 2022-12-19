class UsersController < ApplicationController
  
  before_action :set_user, except: [:root_routing]

  def root_routing
    if user_signed_in?
      path = case current_user.role
      when 'admin'
        dashboard_path
      else
        posts_path
      end

      redirect_to path
    else
      redirect_to posts_path
    end
  end

  def index
  end

  def show
    @posts = @user.posts.published.includes(:user, :reacters)
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
