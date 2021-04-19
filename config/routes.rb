Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  # admin routes
  get '/admin/refresh_availability', to: 'admin#refresh_availability', as: :refresh_availability
  get '/admin/update_movie_details', to: 'admin#update_movie_details', as: :update_details
  resources :admin, only: [:index]
end
