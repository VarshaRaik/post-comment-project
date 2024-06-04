Rails.application.routes.draw do
  
devise_for :users
resources :users
namespace :api do
  resources :posts
end
resources :posts do
  resources :likes
  resources :comments
end
root "posts#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
