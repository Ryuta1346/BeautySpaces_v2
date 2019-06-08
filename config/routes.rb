Rails.application.routes.draw do
  devise_for :customers

  namespace :admin do
    resource :salon, only:[:show]
    resource :stylist, only:[:show]
  end

  resources :users, only:[:show]

  root 'top#home'
  get '/about', to: 'top#about'
  get '/help', to: 'top#help'
  get '/contact', to: 'top#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

## 各種別のユーザー登録は、deviseの画面1つだけにし、種別に応じて登録時にタイプを選択させるようにすれば登録画面を種別分作成せずに済む？
# =>deviseの画面はデフォルト1つだけでOK？
#
# 登録やログイン時のタイプ選択次第でログイン後の画面を変更させるには、コントローラで振り分けさせる？