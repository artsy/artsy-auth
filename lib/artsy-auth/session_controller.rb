module ArtsyAuth
  class SessionsController < ActionController::Base
    def new; end

    def create
      session[:user_id] = auth_hash['uid']
      session[:email] = auth_hash['info']['raw_info']['email']
      session[:access_token] = auth_hash['credentials']['token']
      redirect_to ArtsyAuth.config.callback_url
    end

    def destroy
      reset_session
      redirect_to "#{ArtsyAuth.config.artsy_api_url}/users/sign_out", allow_other_host: true
    end

    protected

    def auth_hash
      request.env['omniauth.auth']
    end
  end
end
