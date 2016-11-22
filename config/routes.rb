Rails.application.routes.draw do
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  get 'pages/about'

  get 'pages/contact_us'

  get '/', to: 'products#index', as: 'index'
  get '/products/:id', to: 'products#show', as: 'show'
  get '/about', to: 'pages#about', as: 'about'
  get '/contact_us', to: 'pages#contact_us', as: 'contact_us'
  # get '/:name', to: 'product#by_category', as: 'product_by_category'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
