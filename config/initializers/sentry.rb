Sentry.init do |config|
  config.dsn = 'https://96b356dae8df4c9f9ff69e66042f3d9f@o4504637936107520.ingest.sentry.io/4504637942005760'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end
