Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "foods#index"
  resources :users do 
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :receipts, only:[:index, :show, :new, :create]  do
      get "/foods/:id/remove" => "receipts#remove_food", as: :remove_food
    end
    resources :publics, only:[:index]
    resources :shoppings, only:[:index]
  end

  resources :foods, only: [:index, :new, :create, :destroy]
end
