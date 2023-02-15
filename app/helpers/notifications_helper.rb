module NotificationsHelper
  def find_post_by_notification(notification)
    if post_present?(notification.post_id)
      Post.find(notification.post_id)
    end
  end

  def post_present?(id)
    Post.where(id: id).present?
  end

  def is_unread?
    current_user.notifications.pluck(:seen).include?(false)
  end
end
