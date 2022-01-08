Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :greeters, only:[:index, :create, :new]
  root to: 'greeters#index'
  post 'greeters/new', to: 'greeters#create'
end
