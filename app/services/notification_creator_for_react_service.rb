class NotificationCreatorForReactService < ApplicationService
  def initialize(current_user:, reactable:, post:)
    @post = post
    @reactable = reactable
    @current_user = current_user
  end

  def call
    Notification.create(content: "#{@current_user.name} has just liked your #{@reactable.class.name.downcase}", sender_id: @current_user.id, receiver_id: @post.user.id, action: :like, post_id: @post.id)
  end
end
