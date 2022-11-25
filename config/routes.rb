Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :devs do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: :destroy
  resources :bookings, only: :index
  get "/dashboard", to: "pages#dashboard"
  resources :bookings, only: [:index, :destroy]
end
