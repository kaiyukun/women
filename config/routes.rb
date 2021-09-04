Rails.application.routes.draw do
  get 'notifications/index'
  get 'rooms/index'
  get 'rooms/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :posts do 
    collection do
      get :top
      get :main
      get :search
    end
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  resources :notifications, :only => [:index, :destroy]
  root 'posts#top'
end
