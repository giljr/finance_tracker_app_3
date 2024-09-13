Rails.application.routes.draw do
  get "pages/home"
  get "pages/about"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "home", to: "pages#home"
  get "about", to: "pages#about"

  # Defines the root path route ("/")
  root "pages#home"
  # root 'stocks#index'
  resources :stocks, only: [:index, :show, :create]
  # devise_for :users

end