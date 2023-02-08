# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do 
  config.hosts << "ed34-2a09-bac1-7aa0-10-00-1bd-6e.ngrok.io"
end
