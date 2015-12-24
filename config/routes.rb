Rails.application.routes.draw do
  resources :listings

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", passwords: "users/passwords" }
  resources :users do 
    get 'dashboard', on: :member

    resources :favorites, only: [:index, :create, :destroy]
    resources :tasks, shallow: true
  end

  root 'site#index'

end
