module ApplicationHelper
  include Pagy::Frontend
  include Turbo::FramesHelper
  include ApexCharts::Helper
  require 'apexcharts'
end
