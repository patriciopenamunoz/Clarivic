Rails.application.routes.draw do
  get 'hostel_features/index'
  get 'hostel_features/create'
  get 'hostel_features/update'
  get 'hostel_features/destroy'
  get 'pages/index'
  get 'dashboard/index'
  root 'pages#index'
  resources :hostels
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  ## API ##
  get 'api/region/:id', to: 'api#region'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
