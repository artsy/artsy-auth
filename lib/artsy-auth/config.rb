# frozen_string_literal: true

module ArtsyAuth
  module Config
    extend self

    attr_accessor :artsy_api_url, :application_id, :application_secret, :callback_url

    def reset
      self.artsy_api_url = nil
      self.callback_url = '/'
      self.application_id = nil
      self.application_secret = nil
    end

    reset
  end

  class << self
    def configure
      if block_given?
        yield(Config)
        OmniAuth::Artsy.configure do |config|
          config.artsy_api_url = ArtsyAuth.config.artsy_api_url
        end
      end
      Config
    end

    def config
      Config
    end
  end
end
