Rails.application.routes.draw do

namespace :admin do
  resources :sessions, only: [:new, :create, :destroy]
  resources :admin, only: :show
  root to: "sessions#new"
end


end
