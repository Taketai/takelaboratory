Rails.application.routes.draw do
  get 'donations/index'
  devise_for :users
  root to: 'donations#index'
  resources :donations
end