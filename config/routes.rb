Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  root "homes#show"

  resource :dashboard, only: [:show]
  
  resources :subs, only: [:index, :create, :destroy]
  resources :sub_searches, only: [:create]

  namespace :link do
    resource :retrievals, only: [:show, :create]
    resources :searches, only: [:create, :update]
  end

  resources :users, only: [:show, :edit, :update] do
    resources :tracks, only: [:create, :update, :destroy]
  end
  resources :votes, only: [:update]
end
