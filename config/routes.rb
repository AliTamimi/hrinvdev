Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  resources :company, only: [:index , :new , :create,:edit, :update ] do
    get 'toggle_active'
  end
  resources :departments
  resources :restrict, only: [:index]
  resources :position, only: [:index , :new , :create ] 
  resources :roles
  resources :role_permissions
  resources :leave_types
  resources :leave_groups
  resources :leaves, only: [:index, :new,:create] do
    member do
      get 'approve'
      get 'reject'
    end
  end
  resources :employees do
    member do
    get 'new_access'
    post 'create_access'
    get 'block_access'  
    get 'allow_access'
    end
    collection do
      get 'employee_info'
      get 'apply_leave'
      post 'apply_leave_update'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
