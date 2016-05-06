Rails.application.routes.draw do

namespace :admin do
  resources :sessions, only: [:new, :create, :destroy]
  resources :admin, only: :show
  resources :venues
  resources :tradeshows do
    get :booth_add, on: :collection
  end

  root to: "sessions#new"
end

  get "public/index"

  root to: "public#index"
end
