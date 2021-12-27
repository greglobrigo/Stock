Rails.application.routes.draw do   
  devise_for :admins, only: [:sessions]
  devise_for :users
  root "welcome#index"
  get 'unapproved' => 'unverified#index'  
  get 'admin' => 'admin#index'
  get 'admin/edit/:id' => 'admin#edituser'
  patch 'admin.:id' => 'admin#updateuser'
  get 'admin/newuser' => 'admin#newuser'
  post 'admin/newuser' => 'admin#createuser'
  get 'admin/show/:id' => 'admin#showuser'
  patch 'admin/approve/:id' => 'admin#approveuser'
  get 'stockapp' => 'stock_app#index'  
  get 'stockapp/buy/:user_id/:name/:ticker/:last_price' => 'stock_app#buy'
  post 'stockapp/buy/:user_id/:name/:ticker/:last_price' => 'stock_app#purchase'
  get 'stockapp/profile' => 'profile#index'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
