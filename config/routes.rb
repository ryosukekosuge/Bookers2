Rails.application.routes.draw do
  devise_for :users
  # get 'books/index'
  # get 'books/show'
  # get 'books/new'
  # get 'books/edit'
  # get 'users/show'
  root "home#top"
  get "home/about"
  get "books/editcheck"
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  # resources :users
  resources :books
end