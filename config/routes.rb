Rails.application.routes.draw do
  resources :requisitions
  get :search, controller: :requisitions
  get 'simulation/index'
  get '/sim', to: 'simulation#new_sim'
  get '/taxes', to: 'simulation#sim'
  resources :criteria_setups
  resources :criteria_impact_definitions
  resources :criteria
  resources :credit_line_settings
  resources :credit_lines
  resources :credit_types
  get 'users/show'
  get 'users/index'
  get 'requisitions/:id/change_status', to: 'requisitions#change_status'
  get 'requisitions/:id/update_requisition_status', to: 'requisitions#update_requisition_status'
  get 'report', to: 'requisitions#report'
  resources :events
  resources :docfiles
  resources :normatives
  resources :posts
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, skip: :registrations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users
end