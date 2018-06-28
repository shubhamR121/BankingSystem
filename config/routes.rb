Rails.application.routes.draw do
  get 'transactions/index'
  get 'transactions/new'
  root 'welcome#index'
  devise_for :users

  resources :welcome

  resources :beneficiaries

  resources :transactions

  resources :users do

    get 'verify', on: :member

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'index' => "welcome#index"
end
