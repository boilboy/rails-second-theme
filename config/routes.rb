Rails.application.routes.draw do
  
  root to:"tops#index"
  devise_for :users

  resources :users, only: %i[index create show edit update]

  resource :profile, only: %i[show edit update]

  resources :rooms

  resources :reservations
  
  post 'reservations/confirm'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
