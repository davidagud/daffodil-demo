Rails.application.routes.draw do
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'carts/show'
  get 'list/index'
  post 'weddings/update_all'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :weddings do
    resources :recipes do
      resources :flowers
      resources :hard_goods
    end
  end

  resources :masterflowers
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  root 'weddings#index'
end
