Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :appointments, only: :create

      get '/realtors/:id/appointments/past', to: 'appointments#past'
      get '/realtors/:id/appointments/future', to: 'appointments#future'
    end
  end
end

# VARIANTE:
# resources :realtors, only: [] do
#     member do
#       resources :appointments, only: [] do
#         collection do
#           get 'past'
#           get 'future'
#         end
#       end
#     end
#   end

  # resources :realtors, only: :show do
  #   resources :appointments, only: :index do
  #     # member do
  #     #   get „past“, to: „appointments#past“
  #     #   get „future“, to: „appointments#future“
  #     # end
  #   end
  # end
