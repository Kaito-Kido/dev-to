class CreateNotificationJob < ApplicationJob
  queue_as :default

  def perform(post, current_user, comment=nil)
    if comment == nil
      NotificationCreatorForPostService.call(post, current_user)
    else
      NotificationCreatorForCommentService.call(post, current_user, comment)
    end
  end
end
