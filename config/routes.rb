Rails.application.routes.draw do
  devise_for :salon
  devise_for :stylist

  namespace :admin do
    resource :salon, only:[:show]
    resource :stylist, only:[:show]
  end

  root 'top#home'
  get '/about', to: 'top#about'
  get '/help', to: 'top#help'
  get '/contact', to: 'top#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
