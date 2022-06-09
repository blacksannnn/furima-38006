Rails.application.routes.draw do
  devise_for :users
<<<<<<< Updated upstream
  root to: "items#index"
  resources :items, only: [:new]
=======
  root to: "products#index"
  resources :products, only: [:new,:create,:index]
   
>>>>>>> Stashed changes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
