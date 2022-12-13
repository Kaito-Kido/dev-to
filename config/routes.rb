Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users
  resources :posts

  get "/users/profile/:id", to: "users#show", as: 'user'
  get "/users/:id/edit/", to: "users#edit", as: 'edit_user'
  patch "/users/:id", to: "users#update", as: 'update_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
