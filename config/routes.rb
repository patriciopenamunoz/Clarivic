Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'pages/index'
  post 'reservations/set_dates_and_redirect'
  post 'reservations/set_dates_room_types'
  post 'reservations/set_dates'
  get 'dashboard/index'
  root 'pages#index'
  resources :reservations, only: [:index]
  resources :hostels do
    resources :hostel_features, only: [:index, :edit, :create, :update, :destroy]
    resources :room_types, only: [:index, :new, :edit, :create, :update, :destroy] do
      post 'reservations/create'
      resources :reservations, only: [:update, :destroy]
    end
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  ## API ##
  get 'api/region/:id', to: 'api#region'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
