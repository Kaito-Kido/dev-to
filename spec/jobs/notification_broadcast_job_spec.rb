require 'rails_helper'

RSpec.describe NotificationBroadcastJob, type: :job do
  describe "#perform later" do
    it "send notification" do
      ActiveJob::Base.queue_adapter = :test
      sender = create(:user)
      receiver = create(:user)
      noti = create(:notification, sender_id: sender.id, receiver_id: receiver.id)
      expect {NotificationBroadcastJob.perform_later(noti)}.to have_enqueued_job
    end
  end
end

