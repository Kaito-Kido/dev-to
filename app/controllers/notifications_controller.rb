class NotificationsController < ApplicationController

  before_action :authenticate_user!

  def index
    @notifications = filter(params)
  end

  def mark_all_read
    notis = current_user.notifications.map do |noti|
      {
        id: noti.id,
        seen: true,
        created_at: noti.created_at,
        updated_at: Time.current
      }
    end
    Notification.upsert_all(notis)

    respond_to do |format|
      format.js
    end
  end

  private

  def filter(params)
    if params[:status]
      if Notification.actions.include?(params[:status])
        @notifications = current_user.notifications.includes(sender: {avatar_attachment: :blob}).send(params[:status])
      end
    else
      @notifications = current_user.notifications.includes(sender: {avatar_attachment: :blob})
    end
  end

end
