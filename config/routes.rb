# frozen_string_literal: true

ArtsyAuth::Engine.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'
end
