Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :order_items
  resources :orders
  resources :customers
  resources :delivery_addresses
  resources :accounts
  resources :provinces
  resources :order_statuses
  resources :sale_items
  resources :categories
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
