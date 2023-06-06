Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "pages#index"
  resources :users do
    resources :user_matches [:new, :edit]
  end
end
