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
    @notifications = if params[:status] && Notification.actions.include?(params[:status])
                       current_user.notifications.includes(sender: { avatar_attachment: :blob }).send(params[:status])
                     else
                       current_user.notifications.includes(sender: { avatar_attachment: :blob })
                     end
  end
end
