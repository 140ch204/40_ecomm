Rails.application.routes.draw do
  root to: 'page_statics#index'
  devise_for :users

  resources :users
  resources :orders
  resources :ordereditems
end
