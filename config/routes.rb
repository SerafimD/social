Rails.application.routes.draw do
  #get 'users/profile'

  devise_for :users
  resources :people
  resources :communities
  resources :community_memberships
  resources :user_relations
  resources :posts
 # resorces  :users, only:[:show, :index]
  #get 'welcome/index'
  root 'welcome#index'
  get 'user_root' => 'users#show_profile'
end
