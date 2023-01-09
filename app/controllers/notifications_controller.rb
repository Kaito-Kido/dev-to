class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = filter(params)
  end

  private

  def filter(params)
    if params[:status]
      @notifications = current_user.notifications.send(params[:status])
    else
      @notifications = current_user.notifications
    end
  end
end
