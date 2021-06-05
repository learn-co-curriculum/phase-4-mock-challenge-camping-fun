Rails.application.routes.draw do
  resources :signups, only: :create
  resources :activities, only: [:index, :destroy]
  resources :campers, only: [:index, :show, :create]
end
