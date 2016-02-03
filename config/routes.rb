Rails.application.routes.draw do
  
  devise_for :users

  resources :applications

  get 'welcome/index'

  root to: "welcome#index"

  namespace :api, defaults: {format: :json} do
    resources :events, only: [create]
  end
end
