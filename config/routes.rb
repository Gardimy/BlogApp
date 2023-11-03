Rails.application.routes.draw do
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts, only: [:new, :create, :show] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create, :destroy]
  end

  # Remove the separate resources for comments
end
