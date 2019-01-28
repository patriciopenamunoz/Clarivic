Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'pages/index'
  post 'reservations/set_dates_and_redirect'
  get 'dashboard/index'
  root 'pages#index'
  resources :hostels do
    resources :hostel_features, only: [:index, :edit, :create, :update, :destroy]
    resources :room_types, only: [:index, :new, :edit, :create, :update, :destroy]
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  ## API ##
  get 'api/region/:id', to: 'api#region'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
