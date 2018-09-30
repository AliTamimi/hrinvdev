Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  resources :company, only: [:index , :new , :create ]
  resources :restrict, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
