Rails.application.routes.draw do
  # resources :categories
  # resources :posts

  resources :users do 
    resources :profiles
  end

  resources :users do 
    resources :posts
  end

  get 'users/:id/profile', to: 'profiles#view', as: 'view_profile'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'

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
