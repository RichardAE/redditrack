Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  root "homes#show"

  resource :dashboard, only: [:show]
  resource :sub, only: [:create, :destroy]
  resource :sub_search, only: [:create]
  resource :link_search, only: [:create]
  resources :links, only: [:show]

  resources :users, only: [:show] do
    resources :tracks, only: [:create, :update]
  end
end
