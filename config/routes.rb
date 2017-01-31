Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root "static_pages#index", as: :authenticated_root
    end
    unauthenticated :user do
      root 'static_pages#index', as: :unauthenticated_root
    end
  end

  resources :users, only: [:index, :destroy]
  resources :trainings
end
