require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

ActiveStorage::Engine.config
                     .active_storage
                     .content_types_to_serve_as_binary
                     .delete('image/svg+xml')

module DevTo
  class Application < Rails::Application
    config.load_defaults 6.1
    config.active_job.queue_adapter = :sidekiq
    Rails.application.routes.default_url_options[:host] = Rails.env == 'production' ? '137.184.91.249' : 'localhost:3000'
  end
end
