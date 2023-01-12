set :output, "log/cron_log.log"
set :environment, ENV['RAILS_ENV']

every 1.day do
  rake "post:check"
end


