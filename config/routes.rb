Rails.application.routes.draw do
  #get 'users/profile'

  devise_for :users
  resources :people
  resources :communities
  #resources :messages

  get 'messages' => 'messages#index'
  post 'messages' => 'messages#index'
  
  #get 'welcome/index'
  root 'welcome#index'
  get 'users/profile', as: 'user_root'
end
