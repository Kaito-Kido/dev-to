require 'rails_helper'

RSpec.describe CreateNotificationJob, type: :job do
  describe "#perform_later" do
    before(:each) do
      ActiveJob::Base.queue_adapter = :test
      @sender = create(:user)
      @receiver = create(:user)
    end
    it "create noti job for comment" do
      post = create(:post, user: @receiver)
      expect {
        CreateNotificationJob.perform_later(post: post, sender: @sender, commentable: post, action: "comment")
      }.to have_enqueued_job.exactly(:once)
    end

    it "create noti job for follow" do
      expect { 
        CreateNotificationJob.perform_later(sender: @sender, receiver_id: @receiver.id, action: "follow")
      }.to have_enqueued_job.exactly(:once)
    end

    it "create noti job for post" do
      post = create(:post, user: @receiver)

      expect {
        CreateNotificationJob.perform_later(post: post, status: "pending", action: "post")
      }.to have_enqueued_job

      expect {
        CreateNotificationJob.perform_later(post: post, sender: @sender, status: "published", action: "post")
      }.to have_enqueued_job

      expect {
        CreateNotificationJob.perform_later(post: post, sender: @sender, status: "declined", action: "post")
      }.to have_enqueued_job
    end

    it "create noti job for react" do
      @post = create(:post, user: @receiver)
      @comment = create(:comment, :for_post, commentable: @post, post_id: @post.id, user: @sender)
      expect {
        CreateNotificationJob.perform_later(sender: @sender, reactable: @post, post: @post, action: "like")
      }.to have_enqueued_job

      expect {
        CreateNotificationJob.perform_later(sender: @sender, reactable: @comment, post: @post, action: "like")
      }.to have_enqueued_job
    end
  end
end
