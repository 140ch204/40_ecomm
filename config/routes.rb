Rails.application.routes.draw do

	root to: 'page_statics#index'
	devise_for :users
  resources :items do
    resources :pictures, only: [:create, :new]
  end

  resources :cart_elements, only: [:destroy, :update, :create]

	resources :users do
		resources :carts
	end

	namespace :admin do
		root to: 'admin#index'
		resources :users, :charges
	end

	resources :orders
	resources :charges
end
