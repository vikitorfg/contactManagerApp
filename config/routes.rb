Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :information, only: [:new, :show, :edit, :create, :update, :destroy]
  resources :contacts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
