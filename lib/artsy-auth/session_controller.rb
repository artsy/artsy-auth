module ArtsyAuth
  class SessionsController < ApplicationController
    skip_before_action :require_artsy_authentication
    def create
      session[:user_id] = auth_hash['uid']
      session[:email] = auth_hash['info']['raw_info']['email']
      session[:access_token] = auth_hash['credentials']['token']
      redirect_to ArtsyAuth.config.callback_url
    end

    def destroy
      reset_session
      redirect_to "#{ArtsyAuth.config.artsy_url}/users/sign_out"
    end

    protected

    def auth_hash
      request.env['omniauth.auth']
    end
  end
end