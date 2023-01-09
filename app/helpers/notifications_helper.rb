module NotificationsHelper
  def find_post_by_notification(notification)
    if notification.post_id.present?
      Post.find(notification.post_id)
    end
  end
end
