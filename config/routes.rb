Rails.application.routes.draw do


namespace :admin do
  resources :sessions, only: [:new, :create, :destroy]

  root to: "sessions#new"
end


end
