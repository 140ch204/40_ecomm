Rails.application.routes.draw do
  root to: 'page_statics#index'
  devise_for :users
  resources :items
  resources :users do
    resources :carts
  end
  resources :orders
  resources :ordereditems
  resources :charges
end
