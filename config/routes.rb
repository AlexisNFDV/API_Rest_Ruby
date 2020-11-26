Rails.application.routes.draw do
  devise_for :users
  resources :computers do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy, :show]
  
  root to: "computers#index"
end
