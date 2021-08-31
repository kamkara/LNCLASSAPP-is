Rails.application.routes.draw do
  get 'espace/index'
  get 'espace/dashboard'
  get 'espace/audition'
  get 'admin/audition'
  get 'admin/index'
  get 'admin/dashboard'
  resources :courses
  resources :materials
  resources :levels
  get 'feed/index'
  devise_for :users
  root to:'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
