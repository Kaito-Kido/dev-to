Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users, path_names: {
    registration: 'register'
}
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
