require 'spec_helper'

module ArtsyAuth
  describe ::UnimplementedController, type: :controller do
    it 'raises NotImplementedError' do
      session[:access_token] = 'accepted-token'
      expect { get :index }.to raise_error NotImplementedError
    end
  end
end
