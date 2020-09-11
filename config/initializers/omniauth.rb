# frozen_string_literal: true

ArtsyAuth::Engine.middleware.use OmniAuth::Builder do
  provider :artsy, ArtsyAuth.config.application_id, ArtsyAuth.config.application_secret
end
