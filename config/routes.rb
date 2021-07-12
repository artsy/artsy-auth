ArtsyAuth::Engine.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/:provider/new', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy'
end
