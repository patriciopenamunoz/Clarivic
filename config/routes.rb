Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'pages/index'
  post 'reservations/set_dates_and_redirect'
  post 'reservations/set_dates_room_types'
  post 'reservations/set_dates'
  get 'dashboard/hostels'
  get 'dashboard/reservations'
  get 'dashboard/hostel/:id/tenants', to: 'dashboard#tenants',
                                                   as: 'dashboard_tenants'
  root 'pages#index'
  get 'reservations/:id/pre_pay', to: 'reservations#pre_pay', as: 'reservation_pre_pay'
  get 'reservations/:id/execute', to: 'reservations#execute', as: 'reservation_execute'
  resources :reservations, only: [:index, :show, :destroy]
  resources :reserved_rooms, only: [:update, :destroy] do
    resources :reservations, only: [:update]
  end
  resources :hostels do
    resources :comments, only: [:create]
    resources :hostel_features, only: [:index, :edit, :create, :update, :destroy]
    resources :room_types, only: [:index, :new, :edit, :create, :update, :destroy] do
      post 'reservations/create'
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
