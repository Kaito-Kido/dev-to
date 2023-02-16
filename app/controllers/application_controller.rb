class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Turbo::FramesHelper

  before_action :load_notifications

  def load_notifications
    return unless user_signed_in?

    @notifications = current_user.notifications.includes(sender: { avatar_attachment: :blob }).order(created_at: :desc).limit(20)
  end
end
