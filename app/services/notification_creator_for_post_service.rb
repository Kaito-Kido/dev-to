class NotificationCreatorForPostService < ApplicationService
  def initialize(post, current_user)
    @post = post
    @current_user = current_user
  end

  def call
    if @post.user.admin?
      User.all.each do |user|
        if user != User.admin[0]
          Notification.create(sender_id: @post.user.id, receiver_id: user.id, action: :post, content: "#{@post.user.name} has just posted an article", post_id: @post.id, seen: false)
        end
      end
    else
      @post.user.followers.each do |follower|
        Notification.create(sender_id: @post.user.id, receiver_id: follower.id, action: :post, content: "#{@post.user.name} has made a post " +  "#{@post.categories.first&.name}", post_id: @post.id, seen: false)
      end
      Notification.create(sender_id: @current_user.id, receiver_id: @post.user.id, action: :post, content: "Admin has just approved your post", post_id: @post.id, seen: false )
    end
  end
end
