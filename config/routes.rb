Rails.application.routes.draw do
  resources :forum_threads
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  Rails.application.routes.draw do
    resources :forum_threads
    resources :users, only: [:create]
    get '/index_category/:category', to: "forum_threads#index_category"
    post '/login', to: "users#login"
    post '/signup', to: "users#create"
    post '/logout', to: "users#logout"
    get '/whoami', to: "application#whoami"
  end
end
