Rails.application.routes.draw do
  get 'meals/show'
  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    passwords: 'customers/passwords'
  }
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get '/customers/my_page' => 'customers#show'
  get '/customers/unsubcribe' => 'customers#unsubcribe'
  patch '/customers/withdraw' => 'customers#withdraw'
  devise_scope :customer do
    post '/customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  end
  resources :customers,only:[:show, :edit, :unsubcribe, :update, :withdraw]
  resources :meals,only:[:index, :new, :create, :show, :edit, :update, :destroy]
  resources :weights,only:[:index, :edit, :create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
