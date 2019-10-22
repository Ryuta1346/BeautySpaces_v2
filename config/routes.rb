Rails.application.routes.draw do
  namespace :admin do
    namespace :salons do
      get 'sales_histories/index'
      get 'sales_histories/show'
      get 'sales_histories/edit'
    end
  end
  namespace :admin do
    namespace :salons do
      get 'reservation_histories/index'
      get 'reservation_histories/show'
      get 'reservation_histories/edit'
    end
  end
  devise_for :salons
  devise_for :users
  devise_for :stylists

  root 'top#home'

  get 'regions/index'
  get 'regions/show'
  get '/about', to: 'top#about'
  get '/help', to: 'top#help'
  get '/contact', to: 'top#contact'
  get '/info', to: 'top#info'

  namespace :admin do
    resource :salon, only: [:show, :edit, :update] do
      resources :reservations, except: [:new], controller: '/admin/salons/reservations'
      resources :reservation_histories, except:[:new], path: 'reserved', as: :reserved, controller: '/admin/salons/reservation_histories'
      # get '/reserved_index', to: 'salons/reservations#reserved_index', as: :reserved_index
      # get '/reserved/:id', to: 'salons/reservations#reserved', as: :reserved
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