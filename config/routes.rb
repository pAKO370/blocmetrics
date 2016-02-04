Rails.application.routes.draw do
  
  devise_for :users

  resources :applications


  get 'welcome/index'

  root to: "welcome#index"

  namespace :api, defaults: {format: :json} do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end
end
