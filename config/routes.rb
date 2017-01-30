Rails.application.routes.draw do
  devise_for :users
  root "classes#index"

  resources :users, only: [:index, :destroy]
end
