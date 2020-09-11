# frozen_string_literal: true

# Configure Rails Envinronment
ENV['RAILS_ENV'] = 'test'
require File.expand_path('dummy/config/environment.rb', __dir__)

# frozen_string_literal: true
# $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
require 'rspec/rails'
require 'artsy-auth'

require 'bundler/setup'
Bundler.require(:runtime, :development)

RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = true
end
