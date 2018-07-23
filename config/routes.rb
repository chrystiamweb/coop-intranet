Rails.application.routes.draw do
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