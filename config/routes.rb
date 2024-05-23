Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
  get 'analytics', to: 'pages#analytics', as: 'analytics'
  get 'cards', to: 'pages#cards', as: 'cards'

  # Defines the root path route ("/")
  # root "posts#index"

  #routes for budgets
  resources :categories do
    resources :budgets, only: [:edit, :new, :create, :update]
    # Nested routes for budgets under categories
  end

    #Routes for managing transactions
  resources :transactions, only: [:index]

end
