Rails.application.routes.draw do
  get 'allages/index'
  root to: "allages#index"
end
