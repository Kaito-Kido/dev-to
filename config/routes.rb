Rails.application.routes.draw do
  get 'follows/create'
  get 'follows/destroy'
  root to: 'home#root_routing'
  get 'home/index', to: "home#index"
  devise_for :users, path_names: {
    registration: 'register'
}, controllers: {registrations: 'users/registrations'}
  resources :posts do 
    resource :react, only: [:create, :destroy]
    resources :comments
    resources :tags, only: [:create, :destroy]

    # collections do
    #   get :reacters_list
    # end
  end
  resources :comments do
    resources :comments
  end
  resources :categories, only: [:create, :destroy, :show]
  resources :users
  get "search", to: "home#search", as: "search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
