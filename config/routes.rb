Rails.application.routes.draw do
  devise_for :users
  resources :computers
  
  root to: "computers#index"
end
