Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy, :index]
  get '/', to: 'sessions#new'
end
