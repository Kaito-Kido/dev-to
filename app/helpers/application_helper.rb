module ApplicationHelper
  require 'apexcharts'
  include Pagy::Frontend
  include Turbo::FramesHelper
  include ApexCharts::Helper
end
