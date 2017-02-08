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
  resources :instructors

  resources :users, only: [:index, :destroy, :show]

  resources :trainings do
    resources :user_histories, only: [:create]
  end

  resources :user_histories, only: [:destroy]
end
