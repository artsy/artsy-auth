require 'spec_helper'

module ArtsyAuth
  describe ::ApplicationController, type: :controller do
    it 'does not interfere with unauthenticated request' do
      get :index
      expect(response.status).to be(200)
    end
  end
end
