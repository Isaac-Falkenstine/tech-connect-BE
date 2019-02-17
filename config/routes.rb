Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/users/find', to: 'users/search#index'

      resources :users, only: [:create, :index, :show, :destroy]

      post '/login', to: 'login#create', as: "login"
      patch '/users', to: 'users#update', as: "update_user"


      resources :locations, only: [:index]
      resources :positions, only: [:index]
      resources :employers, only: [:index]
      resources :messages, only: [:index]

    end
  end
end
