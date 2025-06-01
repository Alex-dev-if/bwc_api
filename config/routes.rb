Rails.application.routes.draw do
  resources :landings
  resources :copies
  resources :books
  resources :users, only: [:create, :index]
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
