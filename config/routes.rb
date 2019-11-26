Rails.application.routes.draw do
  devise_for :users
  root to: 'leagues#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :leagues, only: [:index, :show, :new, :create, :edit, :update] do
    resources :teams, only: [:new, :create]
  end

  resources :teams, only: [] do
    resources :bids, only: [:new, :create]
  end

resources :leagues, only: [:destroy]
end
