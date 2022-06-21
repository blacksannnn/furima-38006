Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  
  get 'purchases/index'
  
  root to: "products#index"
  resources :products, only: [:new,:create,:index,:show,:edit,:update,:destroy]do
  resources :purchases, only: [:create,:index]
  resources :comments, only: [:create]
  end

  
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
