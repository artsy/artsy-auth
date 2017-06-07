class PrivateController < ApplicationController
  include ArtsyAuth::Authenticated

  def index
    render plain: 'Hello from authenticated world'
  end

  private

  def authorized_artsy_token?(token)
    token == 'accepted-token'
  end
end
