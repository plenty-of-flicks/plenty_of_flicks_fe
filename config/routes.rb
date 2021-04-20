Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  # oauth authorization routes
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/google_oauth2', as: :google_login
  get '/logout', to: 'sessions#destroy', as: :google_logout

  # admin routes
  get '/admin/refresh_availability', to: 'admin#refresh_availability', as: :refresh_availability
  get '/admin/update_movie_details', to: 'admin#update_movie_details', as: :update_details
  resources :admin, only: [:index]
end
