Rails.application.routes.draw do
  resources :courses
  resources :schools
  resources :cities
  resources :materials
  resources :levels
  get 'admin/table'
  get 'admin/create'
  get 'admin/index'
  get 'admin/dashboard'
  devise_for :users
  root to:'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
