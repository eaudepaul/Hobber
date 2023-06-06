Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "pages#index"
  resources :users do
    resources :user_matches, only: %i[new edit] do
      resources :appointments, only: %i[new edit create] do
        resources :reviews, only: %i[new create]
      end
    end
  end
  resources :appointments, only: %i[index destroy]
end
