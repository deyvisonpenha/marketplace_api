Rails.application.routes.draw do
    devise_for :users
    #devise_for :users, :controllers => { :products => "api/v1/products" }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products
      resources :sessions, only: [:create, :destroy, :show]
      resources :users, only:[:index, :show, :create, :update, :destroy]
    end
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
