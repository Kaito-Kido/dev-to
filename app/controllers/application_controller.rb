class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Turbo::FramesHelper
end
