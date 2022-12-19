Rails.application.routes.draw do
  root to: 'users#root_routing'
  devise_for :users, path_names: {
    registration: 'register'
}
  resources :posts do 
    resource :react, only: [:create, :destroy]
    resources :comments

    # collections do
    #   get :reacters_list
    # end
  end
  resources :users
  get "archived", to: "posts#archive", as: "dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
