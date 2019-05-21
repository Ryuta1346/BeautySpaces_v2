Rails.application.routes.draw do
  root 'top#home'
  get '/about', to: 'top#about'
  get '/help', to: 'top#help'
  get '/contact', to: 'top#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
