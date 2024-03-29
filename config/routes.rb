Rails.application.routes.draw do
  resources :forum_comments
  resources :forum_threads
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  Rails.application.routes.draw do
    resources :forum_comments
    resources :forum_threads
    resources :users, only: [:create]
    get '/forum_categories', to: "forum_categories#index"
    patch '/forum_categories/:forum', to: "forum_categories#update"
    get '/index_category/:forum_category_id', to: "forum_threads#index_category"
    get '/index_thread/:forum_thread_id', to: "forum_comments#index_thread"
    post '/login', to: "users#login"
    post '/signup', to: "users#create"
    post '/logout', to: "users#logout"
    get '/whoami', to: "application#whoami"
  end
end
