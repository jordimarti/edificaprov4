Rails.application.routes.draw do
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
