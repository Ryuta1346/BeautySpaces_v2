Rails.application.routes.draw do
  devise_for :customers
  root 'top#home'

  get 'regions/index'
  get 'regions/show'
  get '/about', to: 'top#about'
  get '/help', to: 'top#help'
  get '/contact', to: 'top#contact'

  namespace :admin do
    resource :salon, only: [:show, :edit, :update] do
      resources :reservations, except: [:new], controller: '/admin/salons/reservations'
    end

    resource :stylist, only: [:show, :edit, :update] do
      resources :reservations, except: [:new], controller: '/admin/stylists/reservations'
      resources :menus, except: [:new, :show], controller: '/admin/stylists/menus'
    end
  end

  scope module: :admin do
    resource :user, only: [:show, :edit, :update], path: '/mypage'
  end

  resources :regions, only: [:show, :index], path: '/reg', param: :e_name
  resources :prefectures, only: [:show, :index], path: '/pref', param: :e_name
  resources :areas, only: [:show], path: '/area', param: :e_name

  resources :users, only: [:show, :index]
  resources :reservations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end