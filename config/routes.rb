Rails.application.routes.draw do
  root 'users#index'
  get 'welcome/index'
  get 'welcome/about'

  get 'user/login'

  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback', to: 'users#login'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
