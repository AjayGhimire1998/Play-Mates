Rails.application.routes.draw do
 

  resources :users do 
    resources :rooms, only: [:index, :new, :create, :destroy]
  end
  # resources :categories
  # resources :posts
  resources :rooms do 
    resources :messages
  end

  resources :users do 
    resources :profiles, only: [:edit, :new, :create, :update]
  end

  resources :users do 
    resources :posts, only: [:new, :edit, :destroy]
  end

  resources :posts, only: [:index, :create, :update]
  resources :profiles, only: [:index]
  # get '/search', to: "profiles#index"

  get 'users/:id/profile', to: 'profiles#view', as: 'view_profile'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  # get 'sign_up', action: :new, controller: 'registrations'
  
  get 'signup', to: "registrations#new" 
  post 'signup', to: "registrations#create" 
  get 'login', to: "sessions#new" 
  post 'login', to: "sessions#create" 
  get 'logout', to: 'sessions#destroy'
  get 'password/edit', to: 'passwords#edit', as: 'edit_password'
  patch 'password/edit', to: 'passwords#update'
  get '/cancel', to: 'users#destroy'

end
