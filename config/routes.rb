Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/about'
  get 'user/index'

  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback', to: 'users#login'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
