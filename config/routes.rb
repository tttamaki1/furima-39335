Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  get 'orders/new/:id', to: 'orders#new', as: 'new_order'
  post 'orders/create/:id', to: 'orders#create', as: 'place_order'
end
