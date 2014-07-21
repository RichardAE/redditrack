Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  root "homes#show"

  resource :dashboard, only: [:show]
  resources :subs, only: [:create, :destroy]
  resource :sub_search, only: [:create]
  resource :link_search, only: [:create]
  resources :links, only: [:show]
  resources :users, only: [:show, :edit, :update] do
    resources :tracks, only: [:create, :update, :destroy]
  end
  resources :votes, only: [:update]
end
