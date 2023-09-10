Rails.application.routes.draw do
  root "users#index"

  resources :users, only: [:index, :show] do
    # Add a nested resource for user-specific posts
    resources :posts, only: [:index, :show, :create]
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end

  resources :posts, only: [:show]
end
