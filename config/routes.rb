Rails.application.routes.draw do
  devise_for :users
  root 'prototypes/popular#index'

  resources :users, only: [:show, :edit, :update]
  resources :prototypes

  scope module: :prototypes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    resources :popular, only: :index
    resources :newest, only: :index
  end
end
