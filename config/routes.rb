Rails.application.routes.draw do
  get 'photos/index'
  get 'products/new'
  devise_for :users
  root 'homes#index'
  resources :carts do
  	get :checkout, on: :collection
  end
  resources :cart_items
  resources :two_wheelers do
  	get :get_two_wheeler, on: :collection
  end
  resources :photos
end
