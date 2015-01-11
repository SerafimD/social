Rails.application.routes.draw do
  #get 'users/profile'

  devise_for :users
  resources :people
  resources :communities
  resources :community_memberships
 # resorces  :users, only:[:show, :index]
  #get 'welcome/index'
  root 'welcome#index'
  get 'user_root' => 'users#show_profile'
end
