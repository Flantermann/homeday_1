Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :appointments, only: :create

      get '/realtors/:id/appointments/past', to: 'appointments#past'
      get '/realtors/:id/appointments/future', to: 'appointments#future'
    end
  end
end
