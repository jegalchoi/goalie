Rails.application.routes.draw do
  root 'users#index'
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create, :destroy, :show]
end
