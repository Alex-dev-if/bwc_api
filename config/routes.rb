Rails.application.routes.draw do
  get 'returns/create'
  resources :fines
  resources :landings
  resources :copies
  resources :books
  resources :users, only: [:create, :index, :destroy]
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/users/:user_id/fines', to: 'fines#by_user'
end
