Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  resources :tags do
      get 'posts', to: 'posts#search'
  end
end
