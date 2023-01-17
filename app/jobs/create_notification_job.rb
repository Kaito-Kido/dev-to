class CreateNotificationJob < ApplicationJob
  queue_as :default

  def perform(
    post: nil, 
    sender: nil, 
    commentable: nil, 
    status: nil, 
    action: nil,
    reactable: nil,
    receiver_id: nil
  )
    case action
    when "comment"
      NotificationCreatorForCommentService.call(post: post, sender: sender, commentable: commentable)
    when "post"
      NotificationCreatorForPostService.call(post: post, sender: sender, status: status)
    when "like"
      NotificationCreatorForReactService.call(sender: sender, reactable: reactable, post: post)
    when "follow"
      NotificationCreatorForFollowService.call(sender: sender, receiver_id: receiver_id)
    end
  end
end
