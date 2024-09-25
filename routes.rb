Rails.application.routes.draw do
  devise_for :users
  resources :patients
  resources :doctors, only: [:index]
  root to: 'patients#index'
end
