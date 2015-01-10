Rails.application.routes.draw do
  #get 'users/profile'

  devise_for :users
  resources :people
  resources :communities
  #get 'welcome/index'
  root 'welcome#index'
  get 'users/profile', as: 'user_root'
end
