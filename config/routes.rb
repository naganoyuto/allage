Rails.application.routes.draw do
  devise_for :users
  get 'allages/index'
  root to: "allages#index"
end
