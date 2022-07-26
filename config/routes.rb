Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "foods#index"
  resources :receipts, only:[:index, :show] 
  resources :publics, only:[:index]
  resources :shoppings, only:[:index]
end
