Rails.application.routes.draw do
  resources :computers
  
  root to: "computers#index"
end
