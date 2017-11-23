Rails.application.routes.draw do
  root  'home#index'
  resources :entities
  resources :transactions

  mount API => '/'
  mount GrapeSwaggerRails::Engine => "/swagger_doc"
end
