Rails.application.routes.draw do
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