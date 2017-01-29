Rails.application.routes.draw do
  devise_for :users
  root "classes#index"
end
