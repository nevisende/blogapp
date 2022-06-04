Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  resources :user, only: [:index, :show]do
    resources :posts, only: [:index, :show]
  end
end
