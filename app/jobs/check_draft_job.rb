class CheckDraftJob < ApplicationJob
  queue_as :default

  def perform
    Post.draft.each do |post|
      diff_time = (Time.now - post.updated_at) / 1.day
      if diff_time >= 30
        post.destroy
      elsif diff_time >= 29 && diff_time <= 30
        Notification.create(sender_id: User.admin.first.id, receiver_id: post.user.id,
                            content: 'Your draft post will be deleted in 1 day', action: 'post', post_id: post.id)
      end
    end
  end
end
