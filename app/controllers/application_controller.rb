class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Turbo::FramesHelper

  before_action :load_notifications

  def load_notifications
    @notifications = current_user.notifications.includes(sender: {avatar_attachment: :blob}).order(created_at: :desc).limit(20)
  end
end
