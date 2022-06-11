Rails.application.routes.draw do
  root "users#index"
  resources :user, only: [:index, :show]do
    resources :posts, only: [:index, :show]
  end
  get "/posts/new", to: "posts#new"
  post "/posts/create", to: "posts#create"
  post "/users/:user_id/posts/:id/like", to: "likes#create"
  post "/users/:user_id/posts/:id/create_comment", to: "comments#create"
end
