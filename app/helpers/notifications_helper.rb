module NotificationsHelper
  def find_post_by_notification(notification)
    Post.find(notification.post_id) if notification.post_id.present?
  end
end
