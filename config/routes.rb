Rails.application.routes.draw do

  devise_for :users

  root to: 'donations#index'
  resources :donations do
    resources :orders, only: [:index, :create]
  end

  resources :quizzes, only: [:index, :new, :create ] do
    member do
      get 'search'
    end
  end

  get 'quizzes/index'
  post 'quizzes', to: 'quizzes#create'
  get 'quizzes/search'

  
  resources :livechats, only: [:new, :create]

  get 'livechats/new'

  get 'menus/nakama'



end