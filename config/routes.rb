Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :leagues do
    resources :teams, only: [:new, :create]
  end

  resources :teams, only: [:show] do
    resources :bids, only: [:show, :new, :create]
  end

   resources :participations
end
