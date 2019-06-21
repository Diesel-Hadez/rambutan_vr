Rails.application.routes.draw do
#  get 'sessions/new'
#  get 'users/edit'
#  get 'users/new'
#  get 'users/index'
#  get 'users/show'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :movies
  resources :movieitems
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
