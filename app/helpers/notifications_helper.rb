module NotificationsHelper
  def find_post_by_notification(notification)
    Post.find(notification.post_id) if notification.post_id.present?
  end

  def is_unread?
    current_user.notifications.pluck(:seen).include?(false)
  end
end
