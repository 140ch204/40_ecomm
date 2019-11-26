Rails.application.routes.draw do

	root to: 'page_statics#index'
	devise_for :users
	resources :items
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
