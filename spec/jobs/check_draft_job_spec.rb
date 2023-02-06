require 'rails_helper'

RSpec.describe CheckDraftJob, type: :job do
  describe "#perform_later" do
    it "check for draft post" do
      ActiveJob::Base.queue_adapter = :test
      expect {CheckDraftJob.perform_later}.to have_enqueued_job
    end
  end
end
