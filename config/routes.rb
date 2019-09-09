Rails.application.routes.draw do
  root 'application#hello'

  resources :users, only: [:index, :new, :create, :destroy, :show]
end
