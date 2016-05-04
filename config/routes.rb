Rails.application.routes.draw do

namespace :admin do
  resources :sessions, only: [:new, :create, :destroy]
  resources :admin, only: :show
  resources :venues, only: [:index]
  resources :tradeshows, only: [:index]
  root to: "sessions#new"
end


end
