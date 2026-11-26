Rails.application.routes.draw do
  root "carts#show"

  resource :cart, only: [:show, :destroy]
  resources :users, only: [:new, :create]
  resource :session
  resources :passwords, param: :token
  resources :drinks do
    resources :reviews
  end

  post "cart/add/:drink_id", to: "carts#add_to_cart", as: :add_to_cart
  delete "cart/remove/:drink_id", to: "carts#remove_item_from_cart", as: :remove_item_from_cart


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end


## rails tailwindcss:watch
## rails s