Rails.application.routes.draw do
  resources :wikis
  devise_for :users
  resources :charges, only: [:new, :create]
  post "charges/downgrade" => "charges#downgrade"

  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
