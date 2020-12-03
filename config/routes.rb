Rails.application.routes.draw do
  devise_for :users
  resources :computers do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy, :show]
  
  root to: "computers#index"

  get 'with_filter', to: 'computers#with_filter'

  get 'show_with_filter', to: 'computers#show_with_filter'
  resources :computers

end
