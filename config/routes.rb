Rails.application.routes.draw do
  resources :copies
  resources :books
  resources :users, only: [:create]
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
