Rails.application.routes.draw do
  get 'pages/about'

  get 'pages/contact_us'

  get '/', to: 'products#index', as: 'index'
  get '/products/:id', to: 'products#show', as: 'show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
