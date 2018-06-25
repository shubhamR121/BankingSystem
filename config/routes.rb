Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users

  resources :welcome do

    get 'verified', on: :member

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'index' => "welcome#index"
end
