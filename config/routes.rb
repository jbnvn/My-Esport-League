Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'show_post_mercato/:id', to: 'teams#show_post_mercato'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :leagues do
    resources :teams
  end

  resources :teams, only: [:show] do
    resources :bids, only: [:show, :new, :create]
  end

   resources :participations
end
