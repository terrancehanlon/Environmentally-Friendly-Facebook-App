Rails.application.routes.draw do
  devise_for :users

  root 'users#index'

  # get 'welcome/index'
  # get 'welcome/about'
  get 'users/create_account' => 'users#create_account'
  get 'users/create_list' => 'users#create_list'
  get 'users/lists' => 'users#show_lists'
  get 'users/dashboard' => 'users#dashboard'



  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback', to: 'users#login'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
