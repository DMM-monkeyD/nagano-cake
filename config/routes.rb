Rails.application.routes.draw do
  
# devise
  # 管理者用(URL /admin/sign_in ...)
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # 顧客用(URL /customers/sign_in ...)
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

# その他
  # 管理者用
  namespace :admin do
    # root :to => "admin/orders#index"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :order_items, only: [:update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  # 顧客用
  root to: "public/homes#top"
  get "about" =>"public/homes#about"
  get "customers/my_page" => "public/customers#show"
  scope module: :public do
    # root to: "public/homes#top"
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    resources :orders, only: [:index, :show, :new, :create] do
      collection do
        post 'log'
        get 'complete'
      end
    end
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :shipping_address, only: [:index, :create, :edit, :update, :destroy]
  end
  
  # namespace :public do
  #   get 'customers/show'
  #   get 'customers/edit'
  # end
  # namespace :public do
  #   get 'homes/top'
  #   get 'homes/about'
  # end
  
  # # namespace :admin do
  #   # get 'orders/index'
  #   # get 'orders/show'
  # end
  # # namespace :admin do
  # #   get 'customers/index'
  # #   get 'customers/show'
  # #   get 'customers/edit'
  # # end
  # namespace :admin do
  #   get 'genres/index'
  #   get 'genres/edit'
  # end
  # namespace :admin do
  #   get 'items/index'
  #   get 'items/new'
  #   get 'items/show'
  #   get 'items/edit'
  # end
  
  # namespace :public do
  #   get 'shipping_address/index'
  #   get 'shipping_address/edit'
  # end
  # namespace :public do
  #   get 'orders/index'
  #   get 'orders/show'
  #   get 'orders/new'
  #   get 'orders/log'
  #   get 'orders/complete'
  # end
  # namespace :public do
  #   get 'cart_items/index'
  # end
  # namespace :public do
  #   get 'items/index'
  #   get 'items/show'
  # end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
