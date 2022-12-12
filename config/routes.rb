Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users
  resources :posts

  get "/users/profile", to: "users#profile", as: 'profile_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
