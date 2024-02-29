Rails.application.routes.draw do
  resources :pages, except: [:show]
  get '/pages/:permalink' => "pages#permalink", as: 'permalink'

  root to: "home#index"
  resources :pals, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  resources :regions, only: [:index, :show]
  resources :types, only: [:index, :show]
  resources :drops, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
