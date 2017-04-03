require 'spec_helper'

module ArtsyAuth
  describe ApplicationController, type: :controller do
    controller do
      def hello_authenticated_world
        render plain: 'Hello from authenticated world'
      end
    end
    before do
      routes.draw do
        get 'hello_authenticated_world' => 'artsy_auth/application#hello_authenticated_world'
      end
    end
    context 'without session' do
      before do
        get :hello_authenticated_world
      end
      it 'redirects to /auth/artsy' do
        expect(response).to redirect_to('/auth/artsy')
      end
      it 'sets session[:redirect_to]' do
        expect(session.key?(:redirect_to)).to be true
      end
    end
    context 'with session' do
      before do
        session[:access_token] = 'accepted-token'
      end
      context 'wihtout authorized? method' do
        it 'raises NotImplementedError' do
          expect { get :hello_authenticated_world }.to raise_error NotImplementedError
        end
      end
      context 'with authorized? method' do
        controller do
          def hello_authenticated_world
            render plain: 'Hello from authenticated world'
          end

          def authorized?(token)
            token == 'accepted-token'
          end
        end
        before do
          routes.draw do
            get 'hello_authenticated_world' => 'artsy_auth/application#hello_authenticated_world'
          end
        end
        it 'renders page properly with authorized token``' do
          get :hello_authenticated_world
          expect(response.status).to eq 200
          expect(response.body).to eq 'Hello from authenticated world'
        end

        it 'returns forbidden with unaccepted token' do
          session[:access_token] = 'random-token'
          get :hello_authenticated_world
          expect(response.status).to eq 403
        end
      end
    end
  end
end