Rails.application.routes.draw do
  root  'home#index'
  resources :entities
  resources :transactions
end
