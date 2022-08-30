Rails.application.routes.draw do
  get 'rooms/index'
  get 'rooms/show'
  root to: 'homes#top'
  
  get 'homes/about' , as: "about"
  
  devise_for :users
  
  get "search" => "searches#search"
  
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :index, :show]
  
  resources :users do
      get :follows, on: :member
      get :followers, on: :member
    resource :relationships, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
