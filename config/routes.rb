Rails.application.routes.draw do
  resources :listings do 
    resources :deadlines, only: [:create, :update, :destroy], shallow: true
  end

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", passwords: "users/passwords" }
  
  resources :users do 
    get 'dashboard', on: :member

    resources :favorites, only: [:index, :create, :destroy]
    resources :tasks, shallow: true
  end

  root 'site#index'

end
