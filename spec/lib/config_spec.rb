require 'spec_helper'

describe ArtsyAuth::Config do
  describe '#configure' do
    before do
      ArtsyAuth.configure do |config|
        config.artsy_api_url = 'http://localhost:3000/api'
        config.artsy_url = 'http://localhost'
        config.callback_url = '/test'
        config.application_id = 'app_id'
        config.application_secret = 'app_secret'
      end
    end
    after do
      ArtsyAuth.config.reset
    end
    it 'sets token' do
      expect(ArtsyAuth.config.artsy_api_url).to eq 'http://localhost:3000/api'
      expect(ArtsyAuth.config.artsy_url).to eq 'http://localhost'
      expect(ArtsyAuth.config.callback_url).to eq '/test'
      expect(ArtsyAuth.config.application_id).to eq 'app_id'
      expect(ArtsyAuth.config.application_secret).to eq 'app_secret'
    end
  end
end