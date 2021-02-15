Rails.application.routes.draw do

  root to: 'articles#index'

  resources :users
  resources :articles
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

#  get 'sessions/new'
#  get 'sessions/create'
#  get 'sessions/destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end