class NotificationCreatorForComment < ApplicationService
  def initialize(post, current_user, commentable)
    @post = post
    @current_user = current_user
    @commentable = commentable
  end

  def call
    if @current_user != @commentable.user
      Notification.create(sender_id: @current_user.id, receiver_id: @commentable.user.id, content: "#{@current_user.name} has #{is_post?(@commentable) ? "commented" : "replied"} to your #{is_post?(@commentable) ? "post" : "comment"}", action: :comment, post_id: @post.id)
      if !is_post?(@commentable) && @commentable.user != @post.user
        Notification.create(sender_id: @current_user.id, receiver_id: @post.user.id, content: "#{@current_user.name} has commented to your post", action: :comment, post_id: @post.id)
      end
    else
      Notification.create(sender_id: @current_user.id, receiver_id: @post.user.id, content: "#{@current_user.name} has replied to his comment on your post", action: :comment, post_id: @post.id)
    end
  end

  def is_post?(commentable)
    commentable.class.name == "Post"
  end
end
