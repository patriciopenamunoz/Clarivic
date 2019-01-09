Rails.application.routes.draw do
  get 'pages/index'
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
