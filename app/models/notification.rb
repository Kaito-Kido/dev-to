class Notification < ApplicationRecord
  
  enum action: {post: 0, comment: 1, like: 3, follow: 4, reply_comment: 5}

  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  
  after_create :send_notification
  
  def send_notification
    NotificationBroadcastJob.perform_later(self)
  end
end
