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

  # discover routes
  get '/discover/random', to: 'discover#random', as: :discover_random
  resources :discover, only: [:index, :show]

  # admin routes
  get '/admin/refresh_availability', to: 'admin#refresh_availability', as: :refresh_availability
  get '/admin/update_movie_details', to: 'admin#update_movie_details', as: :update_details
  resources :admin, only: [:index]

  # swipes random
  resources :swipes, only: [:create]
end
