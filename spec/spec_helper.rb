$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ice_and_fire_api'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures'
  config.hook_into :faraday
end
