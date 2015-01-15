Rails.application.routes.draw do
  #get 'users/profile'

  devise_for :users
  resources :people
  resources :communities
  resources :community_memberships
  resources :user_relations
  resources :posts

  get 'messages' => 'messages#index'
  post 'messages' => 'messages#index'
  
  #get 'welcome/index'
  root 'welcome#index'
  get 'user_root' => 'users#show_profile'
  #get 'users/profile', as: 'user_root'
end
