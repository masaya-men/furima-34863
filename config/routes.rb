Rails.application.routes.draw do
  get 'comments/create'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create, :show]
    resources :comments, only: [:new, :create]
  end
end
