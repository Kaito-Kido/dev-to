class NotificationCreatorForReactService < ApplicationService
  def initialize(sender:, reactable:, post:)
    @post = post
    @reactable = reactable
    @sender = sender
  end

  def call
    Notification.create(content: "#{@sender.name} has just liked your #{@reactable.class.name.downcase}", sender_id: @sender.id, receiver_id: @post.user.id, action: :like, post_id: @post.id)
  end
end
