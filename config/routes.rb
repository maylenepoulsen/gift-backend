Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]
      resources :groups, only: [:create, :show, :destroy]
      resources :user_groups, only: [:update, :destroy]
      resources :recipients, only: [:create]
      resources :gifts, only: [:create]
      
      get '/invites/:id', to: 'user_groups#invite'
      post '/posts', to: 'groups#posts'
     
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
