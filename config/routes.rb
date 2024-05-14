Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check


  # Defines the root path route ("/")
  # root "posts#index"

  #routes for budgets
  resources :categories do
    resources :budgets, except: [:index, :show]
    # Nested routes for budgets under categories
  end

    #Routes for managing transactions
  resources :transactions, only: [:index]

end
