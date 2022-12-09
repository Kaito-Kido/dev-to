Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts

  get 'users/login', to: 'users#login', as: 'login_user'
  get 'users/signup', to: 'users#new', as: 'new_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
