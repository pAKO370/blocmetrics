Rails.application.routes.draw do
  
  devise_for :users

  resources :applications

  get 'welcome/index'

  root to: "welcome#index"
end
