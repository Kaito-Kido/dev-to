class NotificationCreatorForPostService < ApplicationService
  def initialize(post: nil, sender: nil, status: nil)
    @post = post
    @sender = sender
    @status = status
  end

  def call
    case @status
    when "published"
      if @post.user.admin?
        User.all.each do |user|
          if user != @post.user
            Notification.create(sender_id: @post.user.id, receiver_id: user.id, action: :post, content: "#{@post.user.name} has just posted an article", post_id: @post.id)
          end
        end
      else
        @post.user.followers.each do |follower|
          Notification.create(sender_id: @post.user.id, receiver_id: follower.id, action: :post, content: "#{@post.user.name} has made a post #{@post.categories.first.present? ? "about #{@post.categories.first&.name}" : ""}", post_id: @post.id)
        end
        Notification.create(sender_id: @sender.id, receiver_id: @post.user.id, action: :post, content: "Admin has just approved your post", post_id: @post.id )
      end
    when "pending"
      User.where(role: "admin").each do |admin|
        Notification.create(sender_id: @post.user.id, receiver_id: admin.id, action: :post, content: "#{@post.user.name} has made a post #{@post.categories.first.present? ? "about #{@post.categories.first&.name}" : ""}", post_id: @post.id)
      end
    when "declined"
      Notification.create(sender_id: @sender.id, receiver_id: @post.user.id, action: :post, content: "Admin has declined a post " +  "#{@post.categories.first&.name}", post_id: @post.id)
    end
  end
end
