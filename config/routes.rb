Rails.application.routes.draw do
  get 'accounts/switch'
  get 'accounts/select'
  resources :library_folders
  resources :communities
  resources :courses
  resources :articles
  resources :videos
  resources :channels
  resources :accounts
  devise_for :users
  get 'home/index'
  root to: "home#index"
end
