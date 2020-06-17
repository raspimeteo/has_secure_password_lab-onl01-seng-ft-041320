Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :new]
  resources :sessions, only: [:create]
  get '/welcome', to: "welcome#welcome"
  get '/login', to: "sessions#login"
  post '/login', to: "sessions#login"
  delete 'logout'  => 'sessions#destroy'
end
