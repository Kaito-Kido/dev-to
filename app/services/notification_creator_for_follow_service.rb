class NotificationCreatorForFollowService < ApplicationService
  def initialize(current_user:, receiver_id:)
    @current_user = current_user
    @receiver_id = receiver_id
  end

  def call
    Notification.create(sender_id: @current_user.id, receiver_id: @receiver_id, content: "#{@current_user.name} has followed you", action: :follow)
  end
end
