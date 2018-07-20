Rails.application.routes.draw do
  get 'users/index'
  get 'welcome/index'

  resources :articles do
    resources :comments
  end
  get 'users/login'
  post 'users/new_session'
  get 'users/signup'
  resources :users

  root 'welcome#index'
end
