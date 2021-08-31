Rails.application.routes.draw do
  get 'admin/table'
  get 'admin/create'
  get 'admin/index'
  get 'admin/dashboard'
  resources :courses
  resources :materials
  resources :levels
  devise_for :users
  root to:'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
