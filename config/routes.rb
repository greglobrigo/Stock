Rails.application.routes.draw do
  devise_for :admins, only: [:sessions]
  devise_for :users
  resources :unverified, only: [:index]
  resources :stock_app do
    collection do
      get "/profile" => "stock_app#profile", as: :profile
      get "/transaction_history" => "stock_app#transaction_history", as: :transaction_history
      get "/portfolio" => "stock_app#portfolio", as: :portfolio
      get "/cash_in" => "stock_app#cash_in", as: :cash_in
      post "/cash_in/" => "stock_app#transact_cash_in", as: :transact_cash_in
    end
  end
  #buy
  get "stock_app/buy/:user_id/:name/:ticker/:last_price" => "stock_app#buy", as: :buy
  post "stock_app/buy/:user_id/:name/:ticker/:last_price" => "stock_app#purchase", as: :purchase
  #sell
  get "stock_app/sell/:user_id/:name/:ticker/:last_price" => "stock_app#sell", as: :sell
  post "stock_app/sell/:user_id/:name/:ticker/:last_price" => "stock_app#liquidate", as: :liquidate   
  get "admin" => "admin#index"
  get "admin/edit/:id" => "admin#edituser"
  patch "admin.:id" => "admin#updateuser"
  get "admin/newuser" => "admin#newuser"
  post "admin/newuser" => "admin#createuser"
  get "admin/show/:id" => "admin#showuser"
  patch "admin/approve/:id" => "admin#approveuser"

  root "welcome#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
