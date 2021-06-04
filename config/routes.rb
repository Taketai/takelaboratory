Rails.application.routes.draw do
  devise_for :users

  get 'quizzes/index'
  get 'donations/index'
  post 'quizzes', to: 'quizzes#create'
  
  root to: 'donations#index'
  resources :donations, only: [:index, :new, :create]
  resources :quiz, only: [:index, :new, :create]
end