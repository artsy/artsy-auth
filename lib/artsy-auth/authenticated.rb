module ArtsyAuth
  module Authenticated
    extend ActiveSupport::Concern

    included do
      before_action :require_artsy_authentication
    end

    private

    def require_artsy_authentication
      if session[:access_token]
        head(:forbidden) unless authorized_artsy_token? session[:access_token]
      else
        clear_session_and_reauth! unless session[:access_token]
      end
    end

    def clear_session_and_reauth!
      reset_session
      session[:redirect_to] = request.url
      redirect_to '/auth/artsy'
    end

    def authorized_artsy_token?(token)
      raise NotImplementedError
    end
  end
end
