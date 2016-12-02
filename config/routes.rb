Rails.application.routes.draw do
  get 'cart', to: 'carts#show', as: 'cart'
  resources :order_items, only: [:create, :update, :destroy]
  resources :customer, only: [:new, :create, :update, :destroy]
  get 'login', to: 'session#new', as: 'login'
  post 'login', to: 'session#create', as: 'create_session'
  delete 'destroy', to: 'session#destroy', as: 'logout'
  get 'signup', to: 'accounts#new', as: 'signup'
  post 'signup', to: 'accounts#create', as: 'accounts'
  get 'process_cart', to: 'carts#process_cart', as: 'process_cart'
  get 'checkout', to: 'carts#checkout', as: 'checkout'
  post 'complete', to: 'carts#complete_order', as: 'complete_order'
  # resources :accounts, only: [:new, :create, :update, :destroy]

  get '/categories/:name/products', to: 'products#by_category', as: 'by_category'
  get '/', to: 'products#index', as: 'index'
  get '/products/:id', to: 'products#show', as: 'show'
  get '/about', to: 'pages#about', as: 'about'
  get '/contact_us', to: 'pages#contact_us', as: 'contact_us'
  # get '/:name', to: 'product#by_category', as: 'product_by_category'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
