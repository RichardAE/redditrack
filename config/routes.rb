Rails.application.routes.draw do
  root "homes#show"
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  resource :dashboard, only: [:show]
  
  resources :subreddits, only: [:index, :create, :destroy]
  resources :subreddit_searches, only: [:create]

  namespace :link do
    resource :retrievals, only: [:show, :create]
    resources :searches, only: [:create, :update]
  end

  resources :users, only: [:show, :edit, :update] do
    resources :tracks, only: [:create, :update, :destroy]
  end

  resources :votes, only: [:update]
end
