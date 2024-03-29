class NotificationCreatorForCommentService < ApplicationService
  def initialize(post:, sender:, commentable:)
    @post = post
    @sender = sender
    @commentable = commentable
  end

  def call
    if @sender != @commentable.user
      Notification.create(sender_id: @sender.id, receiver_id: @commentable.user.id,
                          content: "#{@sender.name} has #{post?(@commentable) ? 'commented' : 'replied'} to your #{post?(@commentable) ? 'post' : 'comment'}", action: :comment, post_id: @post.id)
      if !post?(@commentable) &&
         @commentable.user != @post.user &&
         @sender != @post.user
        Notification.create(sender_id: @sender.id, receiver_id: @post.user.id,
                            content: "#{@sender.name} has commented to your post", action: :comment, post_id: @post.id)
      end
    elsif @sender == @commentable.user &&
          @sender != @post.user
      Notification.create(sender_id: @sender.id, receiver_id: @post.user.id,
                          content: "#{@sender.name} has replied to his comment on your post", action: :comment, post_id: @post.id)
    end
  end

  def post?(commentable)
    commentable.instance_of?(::Post)
  end
end
