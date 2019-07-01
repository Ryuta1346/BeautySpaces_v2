Rails.application.routes.draw do
  devise_for :customers

  namespace :admin do
    resource :salon, only: [:show, :edit, :update]
    resource :stylist, only: [:show, :edit, :update]
  end

  scope module: :admin do
    resource :user, only: [:show, :edit, :update], path: '/mypage'
  end

  resources :users, only: [:show, :index]

  root 'top#home'
  get '/about', to: 'top#about'
  get '/help', to: 'top#help'
  get '/contact', to: 'top#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end