require 'omniauth'
require 'omniauth-artsy'

module ArtsyAuth
  class Engine < ::Rails::Engine
    isolate_namespace ArtsyAuth
  end
end
