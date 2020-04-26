Rails.application.routes.draw do
  resources :students
  root to: 'pages#home'
  get 'pages/landing'
  devise_for :users
  resources :roles
  resources :users do
    member do 
      get 'assign_role'
    end
    collection do
      put 'set_role'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
