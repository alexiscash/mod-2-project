Rails.application.routes.draw do
  get 'genres/search', to: 'genres#search'
  resources :genres
  get 'titles/search', to: 'titles#search'
  post 'titles/:id/add-review', to: 'titles#add_review'
  resources :titles
  resources :reviews
  resources :users
  resources :writers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
