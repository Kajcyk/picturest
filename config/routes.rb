Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'about', to: 'home#about'
  get 'terms', to: 'home#terms'
  resources :photos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
