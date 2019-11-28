Rails.application.routes.draw do

	root to: 'page_statics#index'
	devise_for :users
	resources :items do
		resources :pictures, only: [:create, :new]
	end

	resources :cart_elements, only: [:destroy, :update, :create]

	resources :users, :path => "mon_profil" do
		resources :carts, :path => "mon_panier"
	end

	namespace :admin do
		root to: 'admin#index'
		resources :users, :charges, :orders, :carts, :items
	end

	resources :orders, :path => "mes_commandes"
	resources :charges
end
