Rails.application.routes.draw do
  mount ArtsyAuth::Engine => '/'
  get 'private' => 'private#index'
  get 'public' => 'application#index'
  get 'unimplemented' => 'unimplemented#index'
end
