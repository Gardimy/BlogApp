Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'welcome#index'

  devise_scope :user do
    get "/custom_sign_out" => "devise/sessions#destroy", as: :custom_destroy_user_session
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts, only: [:new, :create, :show] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create, :destroy]
  end
end
