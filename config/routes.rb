Rails.application.routes.draw do
  devise_for :users

  get 'quizzes/index'
  # get 'donations/index'
  post 'quizzes', to: 'quizzes#create'
  # patch 'donations', to: 'donations#edit'
  
  root to: 'donations#index'
  resources :donations do
    resources :orders, only: [:index, :create]
  end

  resources :quiz, only: [:index, :new, :create]
end