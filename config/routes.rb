Rails.application.routes.draw do
  root to: 'items#index'
  resources :cards, only: [:new, :create]
end
