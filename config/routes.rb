Rails.application.routes.draw do
  get 'meals/show'
  devise_for :customers
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get '/customers/my_page' => 'customers#show'
  get '/customers/unsubcribe' => 'customers#unsubcribe'
  patch '/customers/withdrawal' => 'customers#withdrawal'
  resources :customers,only:[:show, :edit, :unsubcribe, :update, :withdraw]
  resources :meals,only:[:index, :new, :create, :show, :edit, :update, :destroy]
  resources :weights,only:[:index, :edit, :create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
