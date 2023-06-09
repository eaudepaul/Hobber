Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'chatrooms/index'
  get 'matches/new'
  get 'matches/create'
  get 'appointments/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "pages#index"

  resources :user_matches, only: %i[update index new create] do
    resources :appointments, only: %i[new create]
  end

  resources :chatrooms, only: %i[show index create destroy] do
    resources :messages, only: :create
  end

  resources :users, only: %i[new edit update]

  resources :appointments, only: %i[new show edit] do
    resources :reviews, only: %i[new create]
  end

  resources :appointments, only: %i[index destroy]

  resources :games, only: %i[index new create] do
    resources :user_games, only: %i[create new index]
  end
  resources :user_games, only: %i[destroy]

  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
  end
end
