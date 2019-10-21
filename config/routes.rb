Rails.application.routes.draw do
  resources :titles
  resources :reviews
  resources :users
  resources :writers
  resources :genres
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
