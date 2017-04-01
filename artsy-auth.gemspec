$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'artsy-auth/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'artsy-auth'
  s.version     = ArtsyAuth::VERSION
  s.authors     = ['Artsy']
  s.email       = ['it@artsymail.com']
  s.homepage    = 'http://artsy.net'
  s.summary     = 'ArtsyAuth is a rails based gem that adds Artsy authentication with authorization to your app.'
  s.description = 'See summary.'

  s.files = Dir['{app,config,lib}/**/*', 'Rakefile', 'README.md']

  s.add_dependency 'omniauth-oauth2'
  s.add_dependency 'omniauth-artsy', '>= 0.2.1'
  s.add_dependency 'rails', '>= 4.2.0'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'guard-rubocop'
end