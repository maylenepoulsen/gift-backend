Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]
      resources :groups, only: [:create, :show]
      resources :user_groups, only: [:update, :destroy]
      get '/invites/:id', to: 'user_groups#invite'
      get '/belongs/:id', to: 'user_groups#belongs'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
