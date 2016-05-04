Rails.application.routes.draw do

namespace :admin do
  resources :sessions, only: [:new, :create, :destroy]
  resources :admin, only: :show
  resources :venues, only: [:index, :new]
  resources :tradeshows, only: [:index, :new]
  root to: "sessions#new"
end


end
