Rails.application.routes.draw do
  root to:"tops#index"
  devise_for :users
  resources :users, only: %i[index show edit update]
  resource :profile, only: %i[show edit update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
