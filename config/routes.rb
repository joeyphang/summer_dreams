Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/register' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  resources :sessions, only: [:create]
  resources :users, only: [:new, :create, :show]

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :products

  get '/search' => 'products#search', as: "search"

end
