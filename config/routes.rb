Rails.application.routes.draw do
  resources :computers
  
  root to: "computers#index"

  get 'with_filter', to: 'computers#with_filter'

  get 'show_with_filter', to: 'computers#show_with_filter'
  resources :computers

end
