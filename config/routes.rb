Rails.application.routes.draw do
  resources :reports
  resources :journals
  resources :goals_reports
  resources :requisitions
  get :search, controller: :requisitions
  resources :home
  resources :criteria_setups
  resources :criteria_impact_definitions
  resources :criteria
  resources :credit_line_settings
  resources :credit_lines
  resources :credit_types
  resources :events
  resources :docfiles
  resources :normatives
  resources :posts
  resources :goals_report

  get 'simulation/index'
  get '/sim', to: 'simulation#new_sim' 
  get '/taxes', to: 'simulation#sim'
  get '/goals', to: 'home#goals'
  get '/config', to: 'home#config'

 resources :home do 
  collection { post :import }
  collection { post :report }
 end
 resources :reports do 
  collection { post :new_type }
 end
 

  get 'users/show'
  get 'users/index'
  get 'requisitions/:id/change_status', to: 'requisitions#change_status'
  get 'requisitions/:id/update_requisition_status', to: 'requisitions#update_requisition_status'
  get 'report', to: 'requisitions#report'

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, skip: :registrations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users
end