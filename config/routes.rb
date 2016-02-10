require 'api_constraints'
require 'default_constraints'

Rails.application.routes.draw do

  get '/', to: redirect('/dashboard')

  devise_scope :admin do
    authenticated  do
      root 'dashboard#index'
    end

    unauthenticated do
      root 'admin/sessions#new', as: :unauthenticated_root
    end
  end

  devise_for :admins, controllers: { sessions: 'admin/sessions' }, path_names: { sign_in: '', sign_out: 'logout'}

  namespace :admin, path: '/' do
    resources :dashboard, only: [:index]
    namespace :dashboard, path: '/dashboard' do
      resources :products do
        post '/import' => 'products#import', on: :collection, as: :products_import
        resources :images, only: [:destroy]
      end
      resources :brands
      resources :categories
      resources :orders, only: [:index, :destroy]
    end

  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products,   only: [:show, :index]
      resources :brands,     only: [:index]
      get 'brands/:name' => 'brands#show'
      resources :categories, only: [:show, :index]
      resources :orders,     only: [:create]
    end
  end
end
