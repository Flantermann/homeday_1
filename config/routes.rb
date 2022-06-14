Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :appointments, only: :create

  resources :realtors, only: :show do
    resources :appointments, only: :index do
      # member do
      #   get „past“, to: „appointments#past“
      #   get „future“, to: „appointments#future“
      # end
    end
  end
end
