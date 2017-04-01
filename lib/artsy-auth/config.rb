module ArtsyAuth
  module Config
    extend self

    attr_accessor :artsy_api_url
    attr_accessor :artsy_url
    attr_accessor :application_id
    attr_accessor :application_secret
    attr_accessor :callback_url

    def reset
      self.artsy_api_url = nil
      self.artsy_url = nil
      self.callback_url = '/'
      self.application_id = nil
      self.application_secret = nil
    end

    reset
  end

  class << self
    def configure
      block_given? ? yield(Config) : Config
    end

    def config
      Config
    end
  end
end
