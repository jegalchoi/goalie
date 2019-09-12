Rails.application.routes.draw do
  root 'users#index'
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create, :destroy, :show] do
    resources :comments, only: [:create]
  end
  resources :goals, only: [:create, :show, :new, :destroy, :update] do
    member do
      patch 'user_update'
    end
    resources :comments, only: [:create]
  end
  
end
