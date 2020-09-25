Rails.application.routes.draw do
  get 'interviews/index'
  
  resources :interviews
  resources :users

  root 'users#index'

  get 'users/index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
