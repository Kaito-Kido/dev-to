class Notification < ApplicationRecord
  belongs_to :sender, class_name: User.name
  belongs_to :receiver, class_name: User.name
  
  after_create :send_notification
  
  def send_notification
    NotificationBroadcastJob.perform_now(self)
  end
end
