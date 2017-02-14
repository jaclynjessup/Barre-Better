Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root "static_pages#index", as: :authenticated_root
    end
    unauthenticated :user do
      root 'static_pages#show', as: :unauthenticated_root
    end
  end

  resources :abouts, only: [:index]

  resources :trainings
  resources :instructors, only: [:new, :create, :edit, :update, :destroy, :index]
  resources :timeslots, only: [:new, :create, :edit, :update, :destroy]
  resources :barre_types, only: [:new, :create, :edit, :update, :destroy]

  resources :users, only: [:index, :destroy, :show]

  resources :trainings, only: [:show] do
    resources :user_histories, only: [:create]
  end

  resources :user_histories, only: [:destroy]
end
