# frozen_string_literal: true

require 'spec_helper'

module ArtsyAuth
  describe ::PrivateController, type: :controller do
    context 'without session' do
      it 'redirects to /auth/artsy/new' do
        get :index
        expect(response).to redirect_to('/auth/artsy/new')
      end

      it 'sets session[:redirect_to]' do
        get :index
        expect(session.key?(:redirect_to)).to be true
      end
    end

    context 'with session' do
      before do
        session[:access_token] = 'accepted-token'
      end

      context 'with authorized_artsy_token? method' do
        it 'renders page properly with authorized token' do
          get :index
          expect(response.status).to eq 200
          expect(response.body).to eq 'Hello from authenticated world'
        end

        it 'returns forbidden with unaccepted token' do
          session[:access_token] = 'random-token'
          get :index
          expect(response.status).to eq 403
        end
      end
    end
  end
end
