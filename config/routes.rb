Rails.application.routes.draw do
  resources :members
  resources :departments
  devise_for :users
  resources :users
  resources :permissions
  resources :invoices
  resources :vendors
  
  # put '/invoices/assign_invoice/:id', to: 'invoices#assign_invoice'

  put 'users/:id/updatePermissions', to: 'users#updatePermissions'
  get 'users/:id/user_permissions', to: 'users#user_permissions'
  get 'members/print_member_form/:id', to: 'members#print_member_form', format: 'docx'

  root to: 'members#index'
end
