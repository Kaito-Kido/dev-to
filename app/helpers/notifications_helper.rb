module NotificationsHelper
  def find_post(notification)
    if notification.post_id.present?
      Post.find(notification.post_id)
    end
  end
end
