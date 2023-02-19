require 'sidekiq/web'
Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  mount Sidekiq::Web => '/sidekiq'
  root to: 'home#root_routing'
  get 'home/index', to: 'home#index'
  devise_for :users, path_names: {
    registration: 'register'
  }, controllers: { registrations: 'users/registrations' }
  resources :posts do
    resource :react, only: %i[create destroy]
    resources :comments
    resources :tags, only: %i[create destroy]
    resource :bookmark, only: %i[create destroy]
  end
  resources :comments do
    resources :comments
    resource :react, only: %i[create destroy]
  end
  resources :categories, only: %i[create destroy show]
  resources :users do
    resource :follow, only: %i[create destroy]
    resources :bookmarks, only: [:index]
  end
  get 'search', to: 'home#search', as: 'search'
  resources :notifications do
    collection do
      get 'mark_all_read'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
