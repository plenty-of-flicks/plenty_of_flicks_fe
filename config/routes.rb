Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  # oauth authorization routes
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/google_oauth2', as: :google_login
  get '/logout', to: 'sessions#destroy', as: :google_logout

  # user profile routes
  get '/profile', to: 'profile#show', as: :profile
  get '/profile/edit', to: 'profile#edit', as: :profile_edit
  patch '/profile', to: 'profile#update', as: :profile_update

  # friends routes
  get 'friends/all', to: 'friends#all', as: :friends_all
  resources :friends, only: [:index, :create]

  # groups routes
  get 'groups/all', to: 'groups#all', as: :groups_all
  resources :groups, only: [:index, :new, :create, :show]

  # discover routes
  get '/discover/random', to: 'discover#random', as: :discover_random
  get '/discover/swipe', to: 'discover#swipe', as: :swipe
  resources :discover, only: [:index, :show]

  # admin routes
  get '/admin/refresh_availability', to: 'admin#refresh_availability', as: :refresh_availability
  get '/admin/update_movie_details', to: 'admin#update_movie_details', as: :update_details
  resources :admin, only: [:index]
end
