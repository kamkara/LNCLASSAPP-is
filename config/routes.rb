Rails.application.routes.draw do
  resources :materials
  resources :levels
  get 'feed/index'
  get 'demo/index'
  devise_for :users
  root to:'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
