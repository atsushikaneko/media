Rails.application.routes.draw do

  root "blogs#index"

  get 'password_resets/new'
  get 'password_resets/edit'

  get "/search", to: "blogs#search"

  get "/about",   to: "static_pages#about"
  get "/help",    to: "static_pages#help"
  get "/contact", to: "static_pages#contact"
  get "/setting", to: "static_pages#setting"

  get "/signup", to: "users#new"
  post '/signup',  to: 'users#create'


  resources :users do
    resources :blogs do
      resources :comments
    end
  end

  get "/users/:id/category/:category", to: "users#category"

  get "/tweet", to: "tweets#update"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
