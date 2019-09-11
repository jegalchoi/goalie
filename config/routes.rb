Rails.application.routes.draw do
  root 'users#index'
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create, :destroy, :show]
  resources :goals, only: [:create, :show, :new, :destroy, :update] do
    member do
      patch 'user_update'
    end
  end
  resources :comments, only: [:create]
end
