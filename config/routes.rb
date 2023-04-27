Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :cards, only: [:new, :create]
end
