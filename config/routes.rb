Rails.application.routes.draw do   
  devise_for :admins, only: [:sessions]
  devise_for :users
  # scope '/admins' do
  #   resources :users
  # end
  # resources :users
  root "welcome#index"
  get "/admins/all-users", to: "admin/allusers#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
