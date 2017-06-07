class UnimplementedController < ApplicationController
  include ArtsyAuth::Authenticated

  def index
    render plain: 'Hello from unimplemented world'
  end
end
