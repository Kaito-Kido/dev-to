class NotificationCreatorForFollowService < ApplicationService
  def initialize(sender:, receiver_id:)
    @sender = sender
    @receiver_id = receiver_id
  end

  def call
    Notification.create(sender_id: @sender.id, receiver_id: @receiver_id, content: "#{@sender.name} has followed you", action: :follow)
  end
end
