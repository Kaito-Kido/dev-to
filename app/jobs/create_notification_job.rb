class CreateNotificationJob < ApplicationJob
  queue_as :default

  def perform(post, current_user, comment=nil)
    if comment.present?
      NotificationCreatorForCommentService.call(post, current_user, comment)
    else
      NotificationCreatorForPostService.call(post, current_user)
    end
  end
end
