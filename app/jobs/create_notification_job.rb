class CreateNotificationJob < ApplicationJob
  queue_as :default

  def perform(
    post: nil, 
    current_user: nil, 
    commentable: nil, 
    status: nil, 
    action: nil,
    reactable: nil,
    receiver_id: nil
  )
    case action
    when "comment"
      NotificationCreatorForCommentService.call(post: post, current_user: current_user, commentable: commentable)
    when "post"
      NotificationCreatorForPostService.call(post: post, current_user: current_user, status: status)
    when "like"
      NotificationCreatorForReactService.call(current_user: current_user, reactable: reactable, post: post)
    when "follow"
      NotificationCreatorForFollowService.call(current_user: current_user, receiver_id: receiver_id)
    end
  end
end
