require 'api_constraints'

Rails.application.routes.draw do
  resources :charges
  resources :line_items
  resources :carts
  resources :categories
  resources :authors
  resources :books
  use_doorkeeper do
    # No need to register client application
    skip_controllers :applications, :authorized_applications
  end

  scope module: :api, defaults: { format: :json }, path: 'api' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      devise_for :users, controllers: {
        registrations: 'api/v1/users/registrations',
      }, skip: [:sessions, :password]
    end
  end
end
