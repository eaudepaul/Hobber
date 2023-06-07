Rails.application.routes.draw do
  get 'matches/new'
  get 'matches/create'
  get 'appointments/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "pages#index"

  resources :users, only: %i[show edit update] do
    resources :user_matches, only: %i[new create]
  end

  resources :user_matches, only: %i[new edit] do
    resources :appointments, only: %i[new create]
  end

  resources :appointments, only: %i[show edit] do
    resources :reviews, only: %i[new create]
  end

  resources :appointments, only: %i[index destroy]

  resources :games, only: %i[index new create]
end
