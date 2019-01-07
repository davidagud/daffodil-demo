Rails.application.routes.draw do
  get 'list/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :weddings do
    resources :recipes do
      resources :flowers
    end
  end
  resources :masterflowers

  root 'list#index'
end
