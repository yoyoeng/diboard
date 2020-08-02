Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies do
    resources :reviews, only: [:create] 
    resources :tags, only: [:create]
    resources :votes, only: [:create]
    
    
  end

  root'movies#index'



end
