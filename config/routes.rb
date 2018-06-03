Rails.application.routes.draw do

  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "courses#index"
  resources :courses do 
  	resources :materials
  end
end
