# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'artsy-auth/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'artsy-auth'
  s.version     = ArtsyAuth::VERSION
  s.authors     = ['Artsy']
  s.email       = ['it@artsymail.com']
  s.homepage    = 'https://www.artsy.net'
  s.summary     = 'ArtsyAuth is a Rails engine that adds Artsy authentication with authorization to your app.'
  s.description = 'See summary.'

  s.files = Dir['{app,config,lib}/**/*', 'Rakefile', 'README.md']

  s.add_dependency 'omniauth-artsy', '>= 0.4.0'
  s.add_dependency 'omniauth-oauth2'
  s.add_dependency 'omniauth-rails_csrf_protection', '>= 1.0.0'
  s.add_dependency 'rails', '>= 5.2.0'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'guard-rubocop'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'webdrivers'
  s.add_development_dependency 'webrick'
end
